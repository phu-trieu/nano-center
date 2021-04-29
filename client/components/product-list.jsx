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

  const handleChange = () => {
    const select = document.getElementById('product-type');
    const selectedFilter = select.options[select.selectedIndex].dataset.filter;
    const products = document.querySelectorAll('.product-card');
    if (selectedFilter === 'all') {
      products.forEach(product => {
        product.style.display = 'initial';
      });
    } else {
      products.forEach(product => {
        if (product.classList[2] !== selectedFilter) {
          product.style.display = 'none';
        } else {
          product.style.display = 'initial';
        }
      });
    }
  };

  useEffect(() => {
    getProducts();
  }, []);

  return (
    <section id="product-list">
      <div className="mt-3 product-categories">
        <h1 className="filter-title text-center">All Products</h1>
        <select name="product-type" id="product-type" className="ms-4 mb-2" onChange={handleChange}>
          <option value="all" data-filter="all">All</option>
          <option value="cpu" data-filter="cpu">CPU</option>
          <option value="gpu" data-filter="gpu">GPU</option>
          <option value="motherboards" data-filter="motherboards">Motherboards</option>
          <option value="power-supply" data-filter="power">Power Supply</option>
          <option value="memory" data-filter="memory">Memory</option>
          <option value="cooling" data-filter="cooling">Cooling</option>
          <option value="drives-and-storage" data-filter="storage">Drives & Storage</option>
        </select>
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
