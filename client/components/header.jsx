import React from 'react';

const Header = props => {
  return (
    <header className="py-2 d-flex justify-content-between">
      <div className="d-flex">
        <i onClick={props.handleMenuClick} className="nav-icon fas fa-bars align-self-center mx-3"></i>
        <div onClick={props.goHome} className="header-text d-flex flex-column justify-content-center">
          <h1>Nano Center</h1>
          <p>computers & electronics</p>
        </div>
      </div>
      <div className="d-flex align-items-center me-3 position-relative">
        <i className="fas fa-shopping-cart cart"></i>
        <div className="cart-count position-absolute d-flex justify-content-center align-items-center">
          0
        </div>
      </div>
    </header>
  );
};

export default Header;
