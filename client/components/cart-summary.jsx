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

  return (
    <div className={`cart-menu ${props.cartOpen ? 'active' : ''}`}>
      <h1 className="your-cart ms-1 mt-4">Your Cart</h1>
      {checkCart()}
      <p className="cart-total">{`Total (${props.cart.length} ${props.cart.length === 1 ? 'item' : 'items'}): ${props.total}`}</p>
      <button onClick={checkout} className={`btn checkout-btn mb-2 ${!props.cart.length ? 'disabled' : ''}`}>Checkout</button>
    </div>
  );
};

export default CartSummary;
