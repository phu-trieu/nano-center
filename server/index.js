require('dotenv/config');
const express = require('express');

const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');

const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

app.get('/api/health-check', (req, res, next) => {
  db.query('select \'successfully connected\' as "message"')
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

const validateId = (req, res, next) => {
  const id = Number(req.body.productId) || Number(req.params.cartItemId);
  if (Number.isNaN(id) || id < 0) {
    res.status(400).json({
      error: `${req.body.productId ? 'productId' : 'cartItemId'} must be a positive integer`
    });
    return;
  }
  next();
};

app.get('/api/products', (req, res, next) => {
  const sql = `
    SELECT "productId", "name", "price", "productType", "image", "shortDescription"
    FROM "products";
  `;
  db.query(sql)
    .then(result => res.json(result.rows))
    .catch(err => next(err));
});

app.get('/api/products/:productId', (req, res, next) => {
  const sql = `
    SELECT * FROM "products"
    WHERE "productId" = $1
  `;
  const params = [req.params.productId];

  if (Number.isNaN(Number(req.params.productId))) {
    return next();
  }

  db.query(sql, params)
    .then(result => {
      if (result.rows[0] === undefined) {
        next();
      } else {
        res.json(result.rows[0]);
      }
    })
    .catch(err => next(err));
});

app.get('/api/products/:productType', (req, res, next) => {
  const sql = `
    SELECT * FROM "products"
    WHERE "productType" = $1
  `;
  const params = [req.params.productType];
  db.query(sql, params)
    .then(result => {
      if (result.rows[0] === undefined) {
        next();
      } else {
        res.json(result.rows);
      }
    })
    .catch(err => next(err));
});

app.route('/api/cart')
  .get((req, res, next) => {
    if (!req.session.cartId) {
      return res.json([]);
    } else {
      const sql = `
        SELECT "c"."cartItemId",
        "c"."price",
        "p"."productId",
        "p"."image",
        "p"."name",
        "p"."shortDescription"
        FROM "cartItems" AS "c"
        JOIN "products" AS "p" USING ("productId")
        WHERE "c"."cartId" = $1
      `;
      const params = [req.session.cartId];
      db.query(sql, params)
        .then(result => {
          res.json(result.rows);
        })
        .catch(err => next(err));
    }
  })
  .post(validateId, (req, res, next) => {
    const sql = `
      SELECT "price" FROM "products"
      WHERE "productId" = $1
    `;
    const params = [req.body.productId];
    db.query(sql, params)
      .then(selectQuery => {
        if (selectQuery.rows[0] === undefined) {
          throw new ClientError('productId could not be found', 400);
        }
        if (req.session.cartId) {
          return {
            cartId: req.session.cartId,
            price: selectQuery.rows[0].price
          };
        }
        const sql = `
          INSERT INTO "carts" ("cartId", "createdAt")
          VALUES (default, default)
          RETURNING "cartId"
        `;
        return db.query(sql)
          .then(cart => {
            const { cartId } = cart.rows[0];
            const { price } = selectQuery.rows[0];
            return {
              cartId: cartId,
              price: price
            };
          });
      })
      .then(cartObj => {
        req.session.cartId = cartObj.cartId;
        const sql = `
          INSERT INTO "cartItems" ("cartId", "productId", "price")
          VALUES ($1, $2, $3)
          RETURNING "cartItemId"
        `;
        const params = [cartObj.cartId, req.body.productId, cartObj.price];
        return db.query(sql, params);
      })
      .then(cartItem => {
        const sql = `
          SELECT "c"."cartItemId",
          "c"."price",
          "p"."productId",
          "p"."image",
          "p"."name",
          "p"."shortDescription"
          FROM "cartItems" as "c"
          JOIN "products" as "p" USING ("productId")
          WHERE "c"."cartItemId" = $1
        `;
        const params = [cartItem.rows[0].cartItemId];
        return db.query(sql, params)
          .then(result => {
            res.status(201).json(result.rows[0]);
          });
      })
      .catch(err => next(err));
  });

app.delete('/api/cartItems/:cartItemId', validateId, (req, res, next) => {
  const sql = `
    DELETE FROM "cartItems"
    WHERE "cartItemId" = $1
    RETURNING *
  `;
  const params = [req.params.cartItemId];
  db.query(sql, params)
    .then(result => {
      if (result.rows[0] === undefined) {
        res.status(404).json({ error: 'cartItemId does not exist' });
      } else {
        res.status(204).json();
      }
    })
    .catch(err => next(err));
});

app.post('/api/orders', (req, res, next) => {
  const b = req.body;
  if (!req.session.cartId) {
    return res.status(404).json({
      error: 'cartId does not exist'
    });
  } else if (!b.firstName ||
    !b.lastName ||
    !b.address ||
    !b.city ||
    !b.state ||
    !b.zipCode ||
    !b.phone ||
    !b.cardNumber ||
    !b.nameOnCard ||
    !b.expDate ||
    !b.securityCode) {
    return res.status(400).json({
      error: 'body must include all required parameters'
    });
  }
  const sql = `
    INSERT INTO "orders" ("cartId", "firstName", "lastName", "company", "address", "aptSuite", "city", "state", "zipCode", "phone", "cardNumber", "nameOnCard", "expDate", "securityCode")
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
    RETURNING *
  `;
  const params = [req.session.cartId, b.firstName, b.lastName, b.company, b.address, b.aptSuite, b.city, b.state, b.zipCode, b.phone, b.cardNumber, b.nameOnCard, b.expDate, b.securityCode];
  db.query(sql, params)
    .then(result => {
      if (result.rows[0]) {
        delete req.session.cartId;
        res.status(201).json(result.rows[0]);
      }
    })
    .catch(err => next(err));
});

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
