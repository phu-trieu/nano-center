import React from 'react';
import CartSummaryItem from './cart-summary-item';

const CartSummary = props => {
  const checkCart = () => {
    if (props.cart.length === 0) {
      return (
        <h5 className="ms-2 py-4 secondary-font">Your cart is empty.</h5>
      );
    }
    return props.cart.map(item => <CartSummaryItem checkNameLength={props.checkNameLength} key={item.cartItemId} deleteCartItem={props.deleteCartItem} cartItemId={item.cartItemId} name={item.name} price={item.price} image={item.image[0]} />
    );
  };

  const checkout = () => {
    props.setView({ name: 'checkout', params: { process: 'shipping' } });
    props.setCartOpen(false);
  };

  const closeCartMenu = () => {
    props.setCartOpen(false);
  };

  return (
    <section className={`cart-menu ${props.cartOpen ? 'active' : ''}`}>
      <div className="your-cart ms-1 mt-4 mb-2">
        <h1 className="mb-0">Your Cart</h1>
        <i onClick={closeCartMenu} className="fas fa-times-circle fs-1 align-self-center"></i>
      </div>
      {checkCart()}
      <p className="cart-total">{`Total (${props.cart.length} ${props.cart.length === 1 ? 'item' : 'items'}): ${props.total}`}</p>
      <button onClick={checkout} className={`btn checkout-btn mb-2 ${!props.cart.length ? 'disabled' : ''}`}>Checkout</button>
    </section>
  );
};

export default CartSummary;
