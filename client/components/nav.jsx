import React from 'react';

const Nav = ({ open, setOpen, setView }) => {
  const handleClick = e => {
    setOpen(false);
    setView({
      name: 'filter',
      params: { type: `${e.target.dataset.tag}` }
    });
  };

  const closeMenu = () => {
    setOpen(false);
  };

  return (
    <nav className={open ? 'nav-menu active' : 'nav-menu'}>
      <ul className="nav-ul">
        <div className="categories-grid">
          <div></div>
          <h1 className="mt-3 main-font">Product Categories</h1>
          <i onClick={closeMenu} className="nav-arrow cursor-pointer fas fa-times-circle justify-self-end px-3 pt-2"></i>
        </div>
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
