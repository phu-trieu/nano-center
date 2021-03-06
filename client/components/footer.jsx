import React, { useEffect } from 'react';

const Footer = ({ setFooterHeight }) => {
  const resizeFooter = () => {
    const footer = document.getElementsByTagName('footer')[0];
    const height = footer.clientHeight;
    setFooterHeight(height + 150);
  };

  /** gets footer height whenever footer is resized */
  useEffect(() => {
    window.addEventListener('resize', resizeFooter);

    return () => window.removeEventListener('resize', resizeFooter);
  }, []);

  return (
    <footer className="row justify-content-around mx-0 col">
      <div className="mb-5 col-11 col-md-3">
        <div className="d-flex py-2">
          <div className="logo me-2">
            <img src="/images/favicon-white.png" alt="Nano Center Logo" className="logo-img" />
          </div>
          <div className="logo-text">
            <h2 className="main-font m-0">Nano Center</h2>
            <p className="m-0">computers & electronics</p>
          </div>
        </div>
        <div className="secondary-font logo-text mt-2">
          <p>123 Nano St</p>
          <p>Los Angeles, CA 90001</p>
          <p>(123) 234-3456</p>
        </div>
      </div>
      <div className="logo-text pt-2 mb-5 col-11 col-md-3">
        <h2 className="secondary-font m-0">Hours</h2>
        <p>Monday - Sunday</p>
        <p>10AM - 6PM</p>
      </div>
      <div className="logo-text pt-2 mb-5 col-11 col-md-3">
        <h2 className="secondary-font m-0">Links</h2>
        <p><a href="">FAQ</a></p>
        <p><a href="">Privacy Policy</a></p>
      </div>
      <div className="mb-3 col-11 col-md-3">
        <h2 className="secondary-font pt-2">Follow Us</h2>
        <div className="sm-imgs">
          <a href="https://www.facebook.com" target="_blank" rel="noopener noreferrer">
            <img src="/images/logos/fb-logo.png" alt="" />
          </a>
          <a href="https://www.instagram.com" target="_blank" rel="noopener noreferrer">
            <img src="/images/logos/ig-logo.png" alt="" />
          </a>
          <a href="https://www.youtube.com" target="_blank" rel="noopener noreferrer">
            <img src="/images/logos/yt-logo.png" alt="" />
          </a>
          <a href="https://www.twitter.com" target="_blank" rel="noopener noreferrer">
            <img src="/images/logos/tw-logo.png" alt="" />
          </a>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
