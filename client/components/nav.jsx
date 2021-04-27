import React from 'react';

const Nav = props => {
  return (
    <nav className={props.open ? 'nav-menu active' : 'nav-menu'}>
      <ul className="nav-ul">
        <h1 className="mt-3">Products</h1>
        <li>CPU</li>
        <li>GPU</li>
        <li>Motherboards</li>
        <li>Power Supply</li>
        <li>Memory</li>
        <li>Cooling</li>
        <li>Drives & Storage</li>
      </ul>
    </nav>
  );
};

export default Nav;
