import React, { useEffect, useState } from 'react';
import Carousel from './carousel';

const ProductDetails = props => {
  const [product, setProduct] = useState(null);

  const getProductDetails = productId => {
    fetch(`/api/products/${productId}`)
      .then(response => response.json())
      .then(details => {
        setProduct(details);
      })
      .catch(err => {
        console.error('error:', err);
      });
  };

  const getProductsByType = () => {
    props.setView({
      name: 'filter',
      params: { type: product.productType }
    });
  };

  useEffect(() => {
    getProductDetails(props.params.productId);
  }, []);

  return (
    product && <div className="product-details">
      <nav className="directory secondary-font ms-3 mt-3">
        <u onClick={props.goHome}>Home</u>
        <p> &gt; </p>
        <u onClick={getProductsByType}>{product.productType}</u>
        <p> &gt; </p>
        <p>{product.name}</p>
      </nav>
      <div className="d-grid">
        <div className="ms-3">
          <Carousel imgs={product.image} alt={product.name} />
        </div>
        <div className="ms-3">
          <div className="product-name main-font"><h1>{product.name}</h1></div>
          <div className="secondary-font"><h4>{`$${(product.price / 100).toFixed(2)}`}</h4></div>
          <button className="btn cart-btn secondary-font" onClick={() => props.addToCart(product)}>Add to Cart</button>
        </div>
      </div>
      <div className="w-95 m-auto">
        <h4 className="main-font"><u>Description</u></h4>
        <p className="secondary-font">{product.longDescription}</p>
      </div>
    </div>
  );
};

export default ProductDetails;
