import React, { useState } from 'react';
import { CSSTransition } from 'react-transition-group';

const Carousel = props => {
  const [imgIndex, setImgIndex] = useState(0);
  const [direction, setDirection] = useState('');

  const handleCircleClick = e => {
    const id = Number(e.target.id);
    if (id < imgIndex) {
      setDirection('backward');
    } else {
      setDirection('forward');
    }
    setImgIndex(id);
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
        <img src={props.imgs[imgIndex]} alt={props.alt} className="product-img"/>
      </CSSTransition>
      <div className="d-flex justify-content-evenly col-8 mt-3">
        {props.imgs.map((img, i) => <img key={i} id={i} onClick={handleCircleClick} src={img} className={`carousel-img ${i === imgIndex ? 'active' : ''}`} />)}
      </div>
    </div>
  );
};

export default Carousel;
