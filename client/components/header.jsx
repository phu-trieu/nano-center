import React from 'react';

const Header = () => {
  return (
    <div className="header py-2 d-flex justify-content-between">
      <div className="d-flex">
        <img src="/images/microchip.png" alt="store logo" className="logo mx-2" />
        <div className="header-text d-flex flex-column justify-content-center">
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
    </div>
  );
};

export default Header;
