import React from 'react';

const ProductListItem = props => {
  return (
    <div className="m-3">
      <img src={props.product.image} alt="" className="product-img"/>
      <h5>{props.product.name}</h5>
      <p>{`$${(props.product.price / 100).toFixed(2)}`}</p>
    </div>
  );
};

export default ProductListItem;
