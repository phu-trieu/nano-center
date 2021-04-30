import React from 'react';

const Nav = props => {
  const handleClick = e => {
    // console.log(e.target.dataset.tag);
  };

  return (
    <nav className={props.open ? 'nav-menu active' : 'nav-menu'}>
      <ul className="nav-ul">
        <h1 className="mt-3">Product Categories</h1>
        <li data-tag="CPU" onClick={handleClick}>CPU</li>
        <li data-tag="GPU" onClick={handleClick}>GPU</li>
        <li data-tag="Motherboards" onClick={handleClick}>Motherboards</li>
        <li data-tag="Power" onClick={handleClick}>Power Supply</li>
        <li data-tag="Memory" onClick={handleClick}>Memory</li>
        <li data-tag="Cooling" onClick={handleClick}>Cooling</li>
        <li data-tag="Storage" onClick={handleClick}>Drives & Storage</li>
      </ul>
    </nav>
  );
};

export default Nav;
