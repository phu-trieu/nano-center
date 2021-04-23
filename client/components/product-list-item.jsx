import React from 'react';

const ProductListItem = props => {
  return (
    <div className="product-card m-3">
      <img src={props.product.image} alt="" className="product-img mb-2"/>
      <h4 className="product-name ms-2">{props.product.name}</h4>
      <p className="product-price ms-2">{`$${(props.product.price / 100).toFixed(2)}`}</p>
    </div>
  );
};

export default ProductListItem;
