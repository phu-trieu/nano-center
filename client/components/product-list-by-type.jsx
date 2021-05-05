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

  useEffect(() => {
    getProductsByType(props.type);
  }, [props.type]);

  return (
    <section id="product-list">
      <div style={{ height: props.spacerHeight }}></div>
      <div className="directory ms-3">
        <u onClick={props.goHome}>&lt; Home</u>
      </div>
      <div className="mt-3 product-categories">
        <h1 className="filter-title text-center">{props.type}</h1>
      </div>
      <div className="product-grid">
        {products.map(product => {
          return <ProductListItem key={product.productId} product={product} setView={props.setView} />;
        })}
      </div>
    </section>
  );
};

export default ProductListByType;
