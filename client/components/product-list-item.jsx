import React from 'react';

const ProductListItem = ({ setView, product }) => {
  const handleClick = () => {
    setView({
      name: 'details',
      params: { productId: product.productId }
    });
  };

  const checkNameLength = name => name.length > 80 ? `${name.substr(0, 80)}...` : name;

  return (
    <div onClick={handleClick} className={`product-card cursor-pointer m-3 ${product.productType}`} >
      <img src={product.image[0]} alt="" className="product-img justify-self-center mb-2"/>
      <h4 className="product-name main-font ms-2">{checkNameLength(product.name)}</h4>
      <p className="secondary-font ms-2">{`$${(product.price / 100).toFixed(2)}`}</p>
    </div>
  );
};

export default ProductListItem;
