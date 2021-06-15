import React from 'react';
import CartSummaryItem from './cart-summary-item';

const CheckoutCartSummary = props => {
  const checkCart = () => {
    if (props.cart.length === 0) {
      return (
        <h5 className="ms-2 py-4 secondary-font">Your cart is empty.</h5>
      );
    }
    return props.cart.map(item => <CartSummaryItem checkNameLength={props.checkNameLength} key={item.cartItemId} deleteCartItem={props.deleteCartItem} cartItemId={item.cartItemId} name={item.name} price={item.price} image={item.image[0]} />
    );
  };

  return (
    <section
      className="shipping-cart"
      style={{ top: props.spacerHeight }}
    >
      <h1 className="your-cart main-font ms-3">Your Cart</h1>
      <div className="shipping-cart-items-wrapper">
        {checkCart()}
      </div>
      <h6 className="secondary-font mt-4 ms-3">{`Total (${props.cart.length} ${props.cart.length === 1 ? 'item' : 'items'}): ${props.total}`}</h6>
    </section>
  );
};

export default CheckoutCartSummary;
