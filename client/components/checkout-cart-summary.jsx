import React from 'react';
import CartSummaryItem from './cart-summary-item';

const CheckoutCartSummary = props => {
  const checkCart = () => {
    if (props.cart.length === 0) {
      return (
        <h5 className="ms-2 py-4">Your cart is empty.</h5>
      );
    }
    return props.cart.map(item => <CartSummaryItem key={item.cartItemId} deleteCartItem={props.deleteCartItem} cartItemId={item.cartItemId} name={item.name} price={item.price} image={item.image[0]} />
    );
  };

  return (
    <div className="shipping-cart" style={{ top: props.spacerHeight }}>
      <h1 className="your-cart">Your Cart</h1>
      {checkCart()}
    </div>
  );
};

export default CheckoutCartSummary;
