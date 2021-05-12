import React, { useEffect, useState } from 'react';
import ProductListItem from './product-list-item';

const ProductList = props => {
  const [products, setProducts] = useState([]);

  const getProducts = () => {
    fetch('/api/products')
      .then(response => response.json())
      .then(data => {
        setProducts(data);
      })
      .catch(err => {
        console.error('error:', err);
      });
  };

  useEffect(() => {
    getProducts();
  }, []);

  return (
    <section id="product-list">
      <div className="mt-3 product-categories">
        <h1 className="main-font text-center">All Products</h1>
      </div>
      <div className="product-grid">
        {products.map(product => {
          return <ProductListItem key={product.productId} product={product} setView={props.setView}/>;
        })}
      </div>
    </section>
  );
};

export default ProductList;
