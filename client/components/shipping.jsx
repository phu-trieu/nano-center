import React from 'react';
// import CheckoutCartSummary from './checkout-cart-summary';

const Shipping = props => {
  const handleChange = e => {
    const id = e.target.id;
    const value = e.target.value;
    props.setCheckoutInfo(checkoutInfo => {
      checkoutInfo[id] = value;
      return { ...checkoutInfo };
    });
  };

  const handleSubmit = e => {
    e.preventDefault();
    if (document.querySelector('.shipping-form').checkValidity()) {
      props.setView({
        name: 'checkout',
        params: { process: 'payment' }
      });
    }
  };

  return (
    <div className="hundo">
      <div className="d-flex hundo shipping-info-wrapper">
        <div className="shipping-info">
          <div className="ms-2 shipping-address">
            <div>
              <h5 className="secondary-font">Shipping Address</h5>
              <hr className="shipping-hr" />
            </div>
            <form action="" className="shipping-form" onSubmit={handleSubmit}>
              <div className="hundo">
                <label htmlFor="firstName" className="form-label secondary-font">First Name *</label>
                <input type="text" id="firstName" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo">
                <label htmlFor="lastName" className="form-label secondary-font">Last Name *</label>
                <input type="text" id="lastName" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo">
                <label htmlFor="company" className="form-label secondary-font">Company</label>
                <input type="text" id="company" onChange={handleChange} className="form-control shipping-input" />
              </div>
              <div className="hundo">
                <label htmlFor="address" className="form-label secondary-font">Address *</label>
                <input type="text" id="address" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo">
                <label htmlFor="apt-suite" className="form-label secondary-font">Apt, suite, etc.</label>
                <input type="text" id="apt-suite" onChange={handleChange} className="form-control shipping-input" />
              </div>
              <div className="hundo">
                <label htmlFor="city" className="form-label secondary-font">City *</label>
                <input type="text" id="city" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo">
                <label htmlFor="state" className="form-label secondary-font">State *</label>
                <input type="text" id="state" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo">
                <label htmlFor="zipCode" className="form-label secondary-font">ZIP Code *</label>
                <input type="text" id="zipCode" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo">
                <label htmlFor="phone" className="form-label secondary-font">Phone # *</label>
                <input type="tel" id="phone" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
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
