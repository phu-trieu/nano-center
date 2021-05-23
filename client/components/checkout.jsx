import React, { useState } from 'react';
import Shipping from './shipping';
import Payment from './payment';
import CheckoutCartSummary from './checkout-cart-summary';

const Checkout = props => {
  const [checkoutInfo, setCheckoutInfo] = useState({});
  const [line, setLine] = useState(false);
  const [notAcknowledged, setNotAcknowledged] = useState(true);

  const checkView = () => {
    if (props.view.params.process === 'payment') {
      return <Payment notAcknowledged={notAcknowledged} setNotAcknowledged={setNotAcknowledged} checkoutInfo={checkoutInfo} cart={props.cart} setCart={props.setCart} setOrderInfo={props.setOrderInfo} setCheckoutInfo={setCheckoutInfo} setView={props.setView} />;
    }
    return <Shipping notAcknowledged={notAcknowledged} setNotAcknowledged={setNotAcknowledged} setOrderInfo={props.setOrderInfo} cart={props.cart} setView={props.setView} setCheckoutInfo={setCheckoutInfo} goHome={props.goHome} total={props.total} deleteCartItem={props.deleteCartItem} spacerHeight={props.spacerHeight}/>;
  };

  const handleHover = () => {
    setLine(line => !line);
  };

  const checkParams = () => {
    if (props.view.params.process === 'payment') {
      return props.setView({
        name: 'checkout',
        params: {
          process: 'shipping'
        }
      });
    }
    return props.goHome();
  };

  return (
    <div>
      <div
        onClick={checkParams}
        onMouseEnter={handleHover}
        onMouseLeave={handleHover}
        className="cursor-pointer back-to-shopping d-flex align-items-center mt-2 mb-3 ms-2"
      >
        <i className="fas fa-arrow-left me-1"></i>
        <div className="back-to-shopping">
          <h6 className="main-font my-auto">{`Back to Sh${props.view.params.process === 'payment' ? 'i' : 'o'}pping`}</h6>
          <div className={`line ${line && 'active'}`}></div>
        </div>
      </div>
      <h1 className="your-cart ms-2">Checkout</h1>
      {checkView()}
      <CheckoutCartSummary checkNameLength={props.checkNameLength} cart={props.cart} total={props.total} deleteCartItem={props.deleteCartItem} spacerHeight={props.spacerHeight} />
    </div>
  );
};

export default Checkout;
