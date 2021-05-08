import React, { useState } from 'react';
import Shipping from './shipping';
import Payment from './payment';
import CheckoutCartSummary from './checkout-cart-summary';

const Checkout = props => {
  const [checkoutInfo, setCheckoutInfo] = useState({});
  const checkView = () => {
    if (props.view.params.process === 'payment') {
      return <Payment setCheckoutInfo={setCheckoutInfo} setView={props.setView} />;
    }
    return <Shipping cart={props.cart} setView={props.setView} setCheckoutInfo={setCheckoutInfo} goHome={props.goHome} total={props.total} deleteCartItem={props.deleteCartItem} spacerHeight={props.spacerHeight}/>;
  };

  return (
    <div>
      <div style={{ height: props.spacerHeight }}></div>
      {checkView()}
      <CheckoutCartSummary cart={props.cart} total={props.total} deleteCartItem={props.deleteCartItem} spacerHeight={props.spacerHeight} />
    </div>
  );
};

export default Checkout;
