import React, { useEffect } from 'react';

const Header = props => {
  /** gets header height whenever header is resized */
  useEffect(() => {
    window.addEventListener('resize', () => {
      const header = document.getElementsByTagName('header')[0];
      const height = header.clientHeight;
      props.setSpacerHeight(height);
    });
  }, []);

  return (
    <header className="py-2 d-flex justify-content-between">
      <div className="d-flex">
        <i onClick={props.handleMenuClick} className="nav-icon cursor-pointer fas fa-bars align-self-center mx-3"></i>
        <div onClick={props.goHome} className="header-text cursor-pointer d-flex flex-column justify-content-center">
          <h1 className="main-font">Nano Center</h1>
          <p className="secondary-font">computers & electronics</p>
        </div>
      </div>
      <div onClick={props.handleCartClick} className="cursor-pointer d-flex align-items-center me-3 position-relative">
        <i className="fas fa-shopping-cart cart-icon"></i>
        <div className="cart-count position-absolute d-flex justify-content-center align-items-center">
          {props.cartItemCount}
        </div>
      </div>
    </header>
  );
};

export default Header;
