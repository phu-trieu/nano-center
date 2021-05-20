import React, { useEffect, useState } from 'react';
import Nav from './nav';
import Header from './header';
import Banner from './banner';
import ProductList from './product-list';
import ProductDetails from './product-details';
import ProductListByType from './product-list-by-type';
import CartSummary from './cart-summary';
import Checkout from './checkout';
import CompletedOrder from './completed-order';
import Footer from './footer';
import Modal from 'react-modal';
import ModalComp from './modal';

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
    name: 'catalog',
    params: { }
  });
  const [cart, setCart] = useState([]);
  const [cartOpen, setCartOpen] = useState(false);
  const [spacerHeight, setSpacerHeight] = useState(0);
  const [footerHeight, setFooterHeight] = useState(0);
  const [orderInfo, setOrderInfo] = useState({
    firstName: '',
    orderId: '',
    doa: new Date().toLocaleDateString('en-US').split('/')
  });
  const [modalOpen, setModalOpen] = useState(() => {
    fetch('/api/modalStatus')
      .then(res => res.json())
      .then(status => {
        setModalOpen(status);
      });
  });

  Modal.setAppElement('#root');

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
    if (view.name === 'checkout') return <Checkout setOrderInfo={setOrderInfo} cart={cart} setCart={setCart} view={view} setView={setView} goHome={goHome} total={cart[0] ? calculateTotal() : '$0.00'} deleteCartItem={deleteCartItem} spacerHeight={spacerHeight}/>;
    if (view.name === 'completed-order') return <CompletedOrder view={view.name} orderInfo={orderInfo} setOrderInfo={setOrderInfo} goHome={goHome} />;
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
    return `$${(cart.map(v => v.price).reduce(reducer) / 100).toFixed(2)}`;
  };

  const deleteCartItem = cartItemId => {
    fetch(`/api/cartItems/${cartItemId}`, {
      method: 'DELETE'
    })
      .then(() => {
        cart.forEach((cartItem, i, arr) => {
          if (cartItem.cartItemId === cartItemId) {
            const newCart = cart.slice(cart.splice(i, 1));
            setCart(newCart);
          }
        });
      });
  };

  useEffect(() => {
    getCartItems();
    setSpacerHeight(document.getElementsByTagName('header')[0].clientHeight);
    if (view.name !== 'checkout') {
      setFooterHeight(document.getElementsByTagName('footer')[0].clientHeight + 150);
    }
  }, [view.name]);

  return (
    <div className="hundo">
      <div className="content-wrap" style={view.name !== 'checkout' ? { paddingBottom: footerHeight } : {}}>
        <Nav open={hamburgerOpen} setView={setView} setOpen={setHamburgerOpen} />
        <div onClick={checkMenu()} className={`block ${view.name !== 'catalog' ? 'hundo' : ''}`}>
          <Header setSpacerHeight={setSpacerHeight} handleMenuClick={handleMenuClick} handleCartClick={handleCartClick} goHome={goHome} cartItemCount={cart.length}/>
          <div style={{ height: spacerHeight }}></div>
          {checkView()}
          <div className={hamburgerOpen || cartOpen ? 'shade active' : 'shade'}></div>
        </div>
        <CartSummary setView={setView} cart={cart} deleteCartItem={deleteCartItem} cartOpen={cartOpen} setCartOpen={setCartOpen} total={cart[0] ? calculateTotal() : '$0.00'} />
      </div>
      {(view.name !== 'checkout' ? <Footer setFooterHeight={setFooterHeight} /> : null)}
      <ModalComp modalOpen={modalOpen} setModalOpen={setModalOpen} />
    </div>
  );
};

export default App;
