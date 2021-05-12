import React, { useEffect } from 'react';

const CompletedOrder = props => {
  const date = props.orderInfo.doa;

  useEffect(() => {
    return () => {
      props.setOrderInfo({
        firstName: '',
        orderId: '',
        doa: new Date().toLocaleDateString('en-US').split('/')
      });
    };
  }, [props.view]);

  return (
    <div className="ms-2 mt-4">
      <h1 className="main-font">Thanks for your order, {props.orderInfo.firstName}!</h1>
      <h5 className="secondary-font">Order Number: {String(props.orderInfo.orderId).padStart(8, '0')}</h5>
      <h5 className="secondary-font">Estimated Date of Arrival: {`${date[0]}/${Number(date[1]) + 7}/${date[2]}`}</h5>
      <button className="btn continue-shopping-btn col-9 col-md-7 mt-5" onClick={props.goHome}>Continue Shopping</button>
    </div>
  );
};

export default CompletedOrder;
