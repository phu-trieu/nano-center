import React, { useState } from 'react';
import { CSSTransition } from 'react-transition-group';
import ZoomModal from './zoom-modal';

const Carousel = ({ imgs, alt }) => {
  const [imgIndex, setImgIndex] = useState(0);
  const [direction, setDirection] = useState('');
  const [showModal, setShowModal] = useState(false);

  /** determines direction of sliding animation */
  const handleImgClick = e => {
    const id = Number(e.target.id);
    if (id < imgIndex) {
      setDirection('backward');
    } else {
      setDirection('forward');
    }
    setImgIndex(id);
  };

  const handleModalOpen = () => {
    setShowModal(true);
  };

  return (
    <div className="d-flex flex-column justify-content-center align-items-center mb-3">
      <div className="position-relative">
        <CSSTransition
          key={imgIndex}
          in={true}
          appear={true}
          timeout={300}
          classNames={direction === 'forward' ? 'fade-next' : 'fade-back'}
        >
          <img src={imgs[imgIndex]} alt={alt} className="product-img justify-self-center" />
        </CSSTransition>
        <div onClick={handleModalOpen} className="zoom-overlay cursor-pointer d-grid">
          <h3 className="secondary-font text-light align-self-center justify-self-center">Click to Zoom</h3>
        </div>
        <i className="fas fa-search-plus zoom-icon"></i>
      </div>
      <div className="d-flex justify-content-evenly col-8 mt-3">
        {imgs.map((img, i) => <img key={i} id={i} onClick={handleImgClick} src={img} className={`carousel-img cursor-pointer ${i === imgIndex ? 'active' : ''}`} />)}
      </div>
      <ZoomModal showModal={showModal} setShowModal={setShowModal} imgs={imgs} imgIndex={imgIndex} setImgIndex={setImgIndex} />
    </div>
  );
};

export default Carousel;
