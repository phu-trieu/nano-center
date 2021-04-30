import React from 'react';

const ProductListItem = props => {
  const handleClick = () => {
    props.setView({
      name: 'details',
      params: { productId: props.product.productId }
    });
  };

  return (
    <div onClick={handleClick} className={`product-card m-3 ${props.product.productType}`} >
      <img src={props.product.image[0]} alt="" className="product-img mb-2"/>
      <h4 className="product-name ms-2">{props.product.name}</h4>
      <p className="product-price ms-2">{`$${(props.product.price / 100).toFixed(2)}`}</p>
    </div>
  );
};

export default ProductListItem;
