import React, { useState } from 'react';
// import CheckoutCartSummary from './checkout-cart-summary';

const Shipping = props => {
  const [line, setLine] = useState(false);
  const handleHover = () => {
    setLine(line => !line);
  };
  const handleChange = e => {
    const id = e.target.id;
    const value = e.target.value;
    props.setCheckoutInfo(checkoutInfo => {
      checkoutInfo[id] = value;
      return { ...checkoutInfo };
    });
  };
  // const handleSubmit = () => {
  //   props.setView({
  //     name: 'checkout',
  //     params: { process: 'payment' }
  //   });
  // };

  return (
    <div className="hundo">
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
              <div className="hundo">
                <label htmlFor="first-name" className="form-label secondary-font">First Name *</label>
                <input type="text" id="first-name" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo">
                <label htmlFor="last-name" className="form-label secondary-font">Last Name *</label>
                <input type="text" id="last-name" onChange={handleChange} className="form-control shipping-input" aria-required required="required"/>
              </div>
              <div className="hundo">
                <label htmlFor="company" className="form-label secondary-font">Company</label>
                <input type="text" id="company" onChange={handleChange} className="form-control shipping-input" />
              </div>
              <div className="hundo">
                <label htmlFor="address" className="form-label secondary-font">Address *</label>
                <input type="text" id="address" onChange={handleChange} className="form-control shipping-input" aria-required required="required"/>
              </div>
              <div className="hundo">
                <label htmlFor="apt-suite" className="form-label secondary-font">Apt, suite, etc.</label>
                <input type="text" id="apt-suite" onChange={handleChange} className="form-control shipping-input" />
              </div>
              <div className="hundo">
                <label htmlFor="city" className="form-label secondary-font">City *</label>
                <input type="text" id="city" onChange={handleChange} className="form-control shipping-input" aria-required required="required"/>
              </div>
              <div className="hundo">
                <label htmlFor="state" className="form-label secondary-font">State *</label>
                <input type="text" id="state" onChange={handleChange} className="form-control shipping-input" aria-required required="required"/>
              </div>
              <div className="hundo">
                <label htmlFor="zip-code" className="form-label secondary-font">ZIP Code *</label>
                <input type="text" id="zip-code" onChange={handleChange} className="form-control shipping-input" aria-required required="required"/>
              </div>
              <div className="hundo">
                <label htmlFor="phone" className="form-label secondary-font">Phone # *</label>
                <input type="tel" id="phone" onChange={handleChange} className="form-control shipping-input" aria-required required="required"/>
              </div>
              <button className="submit mb-3" type="submit">Continue to Payment</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Shipping;
