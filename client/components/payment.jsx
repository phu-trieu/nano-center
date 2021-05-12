import React from 'react';

const Payment = props => {
  const c = props.checkoutInfo;

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
    fetch('/api/orders', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(props.checkoutInfo)
    })
      .then(response => response.json())
      .then(orderInfo => {
        const { orderId } = orderInfo;
        props.setOrderInfo(oldOrderInfo => ({
          ...oldOrderInfo, orderId
        }));
        props.setCart([]);
        props.setView(oldView => ({
          ...oldView, name: 'completed-order'
        }));
      });
  };

  return (
    <div>
      <div className="contact-info ms-2 mb-4 secondary-font">
        <div className="border-bottom-checkout">
          <p className="ms-2">Contact</p>
          <p className="ms-2">{`${c.firstName} ${c.lastName}`}</p>
        </div>
        <div className="border-bottom-checkout">
          <p className="ms-2">Ship to</p>
          <p className="ms-2">{`${c.address}, ${c.city}, ${c.state} ${c.zipCode}`}</p>
        </div>
        <div className="ms-2">
          <p>Shipping Method</p>
          <p>First Class</p>
        </div>
      </div>
      <h3 className="ms-2 secondary-font width-fit-content border-bottom-checkout">Payment</h3>
      <form action="" onSubmit={handleSubmit} className="payment-form ms-2">
        <div className="col-11">
          <label htmlFor="cardNumber" className="form-label secondary-font">Card Number *</label>
          <input type="text" placeholder="e.g. 1234 1234 1234 1234" id="cardNumber" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
        </div>
        <div className="col-11">
          <label htmlFor="nameOnCard" className="form-label secondary-font">Name on Card *</label>
          <input type="text" placeholder="e.g. John Doe" id="nameOnCard" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
        </div>
        <div className="col-11">
          <label htmlFor="expDate" className="form-label secondary-font">Expiration Date (MM/YY) *</label>
          <input type="text" placeholder="e.g. 01/25" id="expDate" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
        </div>
        <div className="col-11">
          <label htmlFor="securityCode" className="form-label secondary-font">Security Code *</label>
          <input type="text" placeholder="e.g. 123" id="securityCode" onChange={handleChange} className="form-control shipping-input" aria-required required="required" />
        </div>
        <button className="submit mb-3" type="submit">Pay Now</button>
      </form>
    </div>
  );
};

export default Payment;
