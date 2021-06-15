import React from 'react';

const Banner = () => {
  return (
    <section id="banner" className="position-relative">
      <img
        src="/images/banner.jpg"
        alt="Banner; picture of motherboard"
        className="banner-img " />
      <div className="banner-text-container main-font position-absolute d-flex align-items-center justify-content-center">
        <div className="banner-text d-flex flex-column align-items-center flex-wrap">
          <p className="text-center">Welcome to Nano Center!</p>
          <p className="text-center">Your one-stop shop for anything computer-related</p>
        </div>
      </div>
    </section>
  );
};

export default Banner;
