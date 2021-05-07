import React, { useState } from 'react';
import CheckoutCartSummary from './checkout-cart-summary';

const Shipping = props => {
  const [line, setLine] = useState(false);
  const handleHover = () => {
    setLine(line => !line);
  };

  return (
    <div className="hundo">
      <div style={{ height: props.spacerHeight }}></div>
      <div className="d-flex hundo shipping-info-wrapper">
        <div className="shipping-info">
          <div
            onClick={props.goHome}
            onMouseEnter={handleHover}
            onMouseLeave={handleHover}
            className="cursor-pointer back-to-shopping d-flex align-items-center mt-2 mb-3 ms-2"
          >
            <i className="fas fa-arrow-left me-1"></i>
            <div className="back-to-shopping">
              <h6 className="main-font my-auto">Back to Shopping</h6>
              <div className={`line ${line && 'active'}`}></div>
            </div>
          </div>
          <div className="ms-2 shipping-address">
            <h1 className="your-cart">Checkout</h1>
            <div>
              <h5 className="secondary-font">Shipping Address</h5>
              <hr className="shipping-hr"/>
            </div>
            <form action="" className="shipping-form">
              <div>
                <label htmlFor="first-name" className="form-label secondary-font">First Name *</label>
                <input type="text" id="first-name" className="form-control shipping-input" aria-required required="required" />
              </div>
              <div>
                <label htmlFor="last-name" className="form-label secondary-font">Last Name *</label>
                <input type="text" id="last-name" className="form-control shipping-input" aria-required required="required"/>
              </div>
              <div>
                <label htmlFor="company" className="form-label secondary-font">Company</label>
                <input type="text" id="company" className="form-control shipping-input" />
              </div>
              <div>
                <label htmlFor="address" className="form-label secondary-font">Address *</label>
                <input type="text" id="address" className="form-control shipping-input" aria-required required="required"/>
              </div>
              <div>
                <label htmlFor="apt-suite" className="form-label secondary-font">Apt, suite, etc.</label>
                <input type="text" id="apt-suite" className="form-control shipping-input" />
              </div>
              <div>
                <label htmlFor="city" className="form-label secondary-font">City *</label>
                <input type="text" id="city" className="form-control shipping-input" aria-required required="required"/>
              </div>
              <div>
                <label htmlFor="state" className="form-label secondary-font">State *</label>
                <input type="text" id="state" className="form-control shipping-input" aria-required required="required"/>
              </div>
              <div>
                <label htmlFor="zip-code" className="form-label secondary-font">ZIP Code *</label>
                <input type="text" id="zip-code" className="form-control shipping-input" aria-required required="required"/>
              </div>
              <div>
                <label htmlFor="phone" className="form-label secondary-font">Phone # *</label>
                <input type="tel" id="phone" className="form-control shipping-input" aria-required required="required"/>
              </div>
              <button className="submit mb-3" type="submit">Continue to Payment</button>
            </form>
          </div>
        </div>
        <CheckoutCartSummary cart={props.cart} total={props.total} deleteCartItem={props.deleteCartItem} spacerHeight={props.spacerHeight} />
      </div>
    </div>
  );
};

export default Shipping;
