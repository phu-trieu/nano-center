import React from 'react';

const Banner = () => {
  return (
    <section className="position-relative">
      <img
        src="/images/banner.jpg"
        alt="Banner; picture of motherboard"
        className="banner-img " />
      <div className="banner-text-container position-absolute d-flex align-items-center justify-content-center">
        <div className="banner-text d-flex flex-column align-items-center flex-wrap">
          <p id="banner-text-title" className="text-center">Welcome to Nano Center!</p>
          <p id="banner-text-caption" className="text-center">Your one-stop shop for anything computer-related</p>
        </div>
      </div>
    </section>
  );
};

export default Banner;
