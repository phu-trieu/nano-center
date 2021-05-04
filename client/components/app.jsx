import React, { useEffect, useState } from 'react';
import Nav from './nav';
import Header from './header';
import Banner from './banner';
import ProductList from './product-list';
import ProductDetails from './product-details';
import ProductListByType from './product-list-by-type';
import CartSummary from './cart-summary';

// export default class App extends React.Component {
//   constructor(props) {
//     super(props);
//     this.state = {
//       message: null,
//       isLoading: true
//     };
//   }

//   componentDidMount() {
//     fetch('/api/health-check')
//       .then(res => res.json())
//       .then(data => this.setState({ message: data.message || data.error }))
//       .catch(err => this.setState({ message: err.message }))
//       .finally(() => this.setState({ isLoading: false }));
//   }

//   render() {
//     return this.state.isLoading
//       ? <h1>Testing connections...</h1>
//       : <h1>{this.state.message}</h1>;
//   }
// }

const App = () => {
  const [hamburgerOpen, setHamburgerOpen] = useState(false);
  const [view, setView] = useState({
    name: 'details',
    params: { productId: 1 }
  });
  const [cart, setCart] = useState([]);
  const [cartOpen, setCartOpen] = useState(true);

  const handleMenuClick = () => {
    setHamburgerOpen(state => !state);
  };

  const handleCartClick = () => {
    setCartOpen(state => !state);
  };

  const goHome = () => {
    setView({
      name: 'catalog',
      params: {}
    });
  };

  const checkView = () => {
    if (view.name === 'catalog') {
      return (
        <div>
          <Banner />
          <ProductList setView={setView} />
        </div>
      );
    }
    if (view.name === 'details') return <ProductDetails params={view.params} setView={setView} goHome={goHome} addToCart={addToCart} />;
    if (view.name === 'filter') return <ProductListByType type={view.params.type} setView={setView} goHome={goHome} />;
  };

  const getCartItems = () => {
    fetch('/api/cart')
      .then(response => response.json())
      .then(cartItems => setCart(cartItems));
  };

  const addToCart = product => {
    fetch('/api/cart', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(product)
    })
      .then(response => response.json())
      .then(cartItem => {
        setCart(oldCart => [...oldCart, cartItem]);
      });
  };

  const checkMenu = () => {
    if (hamburgerOpen) return handleMenuClick;
    if (cartOpen) return handleCartClick;
  };

  const calculateTotal = () => {
    const reducer = (acc, current) => acc + current;
    return `$${cart.map(v => v.price).reduce(reducer) / 100}`;
  };

  useEffect(() => {
    getCartItems();
  }, []);

  return (
    <div className="hundo">
      <Nav open={hamburgerOpen} setView={setView} setOpen={setHamburgerOpen} />
      <div onClick={checkMenu()} className={`block ${view.name === 'details' || view.name === 'filter' ? 'hundo' : ''}`}>
        <Header handleMenuClick={handleMenuClick} handleCartClick={handleCartClick} goHome={goHome} cartItemCount={cart.length}/>
        {checkView()}
        <div className={hamburgerOpen || cartOpen ? 'shade active' : 'shade'}></div>
      </div>
      <CartSummary cart={cart} cartOpen={cartOpen} setCartOpen={setCartOpen} total={cart[0] ? calculateTotal() : '$0.00'} length={cart.length}/>
    </div>
  );
};

export default App;
