import React from 'react';
import CartSummaryItem from './cart-summary-item';

const CartSummary = props => {
  const checkCart = () => {
    if (props.cart.length === 0) {
      return (
        <h5 className="ms-2 py-4">Your cart is empty.</h5>
      );
    }
    return props.cart.map(item => <CartSummaryItem key={item.cartItemId} deleteCartItem={props.deleteCartItem} cartItemId={item.cartItemId} name={item.name} price={item.price} image={item.image[0]} />
    );
  };

  const checkout = () => {
    props.setView({ name: 'shipping', params: {} });
    props.setCartOpen(false);
  };

  return (
    <div className={`cart-menu ${props.cartOpen ? 'active' : ''}`}>
      <h1 className="your-cart ms-1 mt-4">Your Cart</h1>
      {checkCart()}
      <p className="cart-total">{`Total (${props.cart.length} ${props.cart.length === 1 ? 'item' : 'items'}): ${props.total}`}</p>
      <button onClick={checkout} className="checkout-btn mb-2">Checkout</button>
    </div>
  );
};

export default CartSummary;
