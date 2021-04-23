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
    <div className="">
      <div className="mt-3 product-categories">
        <select name="product-type" id="product-type">
          <option value="all">All</option>
          <option value="cpu">CPU</option>
          <option value="gpu">GPU</option>
          <option value="motherboards">Motherboards</option>
          <option value="power-supply">Power Supply</option>
          <option value="memory">Memory</option>
          <option value="cooling">Cooling</option>
          <option value="drives-and-storage">Drives & Storage</option>
        </select>
        <h1 className="filter-title text-center">All Products</h1>
      </div>
      <div className="product-grid">
        {products.map(product => {
          return <ProductListItem key={product.productId} product={product} />;
        })}
      </div>
    </div>
  );
};

export default ProductList;
