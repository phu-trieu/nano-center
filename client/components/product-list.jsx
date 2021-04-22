import React, { useEffect, useState } from 'react';
import ProductListItem from './product-list-item';

const ProductList = () => {
  const [products, setProducts] = useState([]);

  const getProducts = () => {
    fetch('/api/products')
      .then(response => response.json())
      .then(data => {
        setProducts(data);
      });
  };

  useEffect(() => {
    getProducts();
  }, []);

  return (
    <div className="d-flex flex-wrap justify-content-center">
      <div className="product-grid">
        {products.map(product => {
          return <ProductListItem key={product.productId} product={product} />;
        })}
      </div>
    </div>
  );
};

export default ProductList;
