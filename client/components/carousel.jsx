import React, { useState } from 'react';
import { CSSTransition } from 'react-transition-group';
import ZoomModal from './zoom-modal';

const Carousel = ({ imgs, alt }) => {
  const [imgIndex, setImgIndex] = useState(0);
  const [direction, setDirection] = useState('');
  const [showModal, setShowModal] = useState(false);

  const handleCircleClick = e => {
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
      <CSSTransition
        key={imgIndex}
        in={true}
        appear={true}
        timeout={300}
        classNames={direction === 'forward' ? 'fade-next' : 'fade-back'}
      >
        <img onClick={handleModalOpen} src={imgs[imgIndex]} alt={alt} className="product-img"/>
      </CSSTransition>
      <div className="d-flex justify-content-evenly col-8 mt-3">
        {imgs.map((img, i) => <img key={i} id={i} onClick={handleCircleClick} src={img} className={`carousel-img ${i === imgIndex ? 'active' : ''}`} />)}
      </div>
      <ZoomModal showModal={showModal} setShowModal={setShowModal} imgs={imgs} imgIndex={imgIndex} setImgIndex={setImgIndex} />
    </div>
  );
};

export default Carousel;
