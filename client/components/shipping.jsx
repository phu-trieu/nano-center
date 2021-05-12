import React from 'react';

const Shipping = props => {
  const handleChange = e => {
    const id = e.target.id;
    const value = e.target.value;
    props.setCheckoutInfo(checkoutInfo => {
      checkoutInfo[id] = value;
      return { ...checkoutInfo };
    });
  };

  const handleOrderInfo = e => {
    e.persist();
    handleChange(e);
    props.setOrderInfo(oldOrderInfo => ({
      ...oldOrderInfo, firstName: e.target.value
    }));
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
              <div className="hundo mb-3">
                <label htmlFor="firstName" className="form-label secondary-font">First Name *</label>
                <input type="text" placeholder="e.g. John" id="firstName" onChange={handleOrderInfo} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo mb-3">
                <label htmlFor="lastName" className="form-label secondary-font">Last Name *</label>
                <input type="text" placeholder="e.g. Doe" id="lastName" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo mb-3">
                <label htmlFor="company" className="form-label secondary-font">Company</label>
                <input type="text" placeholder="e.g. Nano Center" id="company" onChange={handleChange} className="form-control shipping-input" />
              </div>
              <div className="hundo mb-3">
                <label htmlFor="address" className="form-label secondary-font">Address *</label>
                <input type="text" placeholder="e.g. 123 Nano St" id="address" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo mb-3">
                <label htmlFor="apt-suite" className="form-label secondary-font">Apt, suite, etc.</label>
                <input type="text" placeholder="e.g. Apt 1" id="apt-suite" onChange={handleChange} className="form-control shipping-input" />
              </div>
              <div className="hundo mb-3">
                <label htmlFor="city" className="form-label secondary-font">City *</label>
                <input type="text" placeholder="e.g. Los Angeles" id="city" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo mb-3">
                <label htmlFor="state" className="form-label secondary-font">State *</label>
                <input type="text" id="state" placeholder="e.g. California, CA, or California (CA)" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo mb-3">
                <label htmlFor="zipCode" className="form-label secondary-font">ZIP Code *</label>
                <input type="text" placeholder="e.g. 12345" id="zipCode" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <div className="hundo mb-3">
                <label htmlFor="phone" className="form-label secondary-font">Phone # *</label>
                <input type="tel" placeholder="e.g. (123) 123-7890" id="phone" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
              </div>
              <button className={`btn submit mb-3 ${!props.cart.length ? 'disabled' : ''}`} type="submit">Continue to Payment</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Shipping;
