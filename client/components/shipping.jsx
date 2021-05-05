import React from 'react';

const Shipping = props => {
  return (
    <div className="hundo">
      <div style={{ height: props.spacerHeight }}></div>
      <div className="d-flex hundo">
        <div className="shipping-info col-7"></div>
        <div className="shipping-cart col-5"></div>
      </div>
    </div>
  );
};

export default Shipping;
