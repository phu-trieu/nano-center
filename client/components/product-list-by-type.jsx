import React, { useEffect, useState } from 'react';
import ProductListItem from './product-list-item';

const ProductListByType = props => {
  const [products, setProducts] = useState([]);

  const getProductsByType = productType => {
    fetch(`/api/products/${productType}`)
      .then(response => response.json())
      .then(data => {
        setProducts(data);
      })
      .catch(err => {
        console.error('error:', err);
      });
  };

  const checkArrItemsExist = () => {
    if (products.length) {
      return products.map(product => {
        return <ProductListItem key={product.productId} product={product} setView={props.setView} />;
      });
    }
    return <div className="text-center secondary-font">No products were found</div>;
  };

  useEffect(() => {
    getProductsByType(props.type);
  }, [props.type]);

  return (
    <section id="product-list">
      <div className="directory ms-3 mt-3 secondary-font">
        <u onClick={props.goHome}>
          Home
        </u>
        <p> &gt;</p>
        <p> {props.type}</p>
      </div>
      <div className="mt-3 product-categories">
        <h1 className="main-font text-center">{props.type}</h1>
      </div>
      <div className="product-grid">
        {checkArrItemsExist()}
      </div>
    </section>
  );
};

export default ProductListByType;
