import React, { useState } from 'react';
import { CSSTransition } from 'react-transition-group';

const Carousel = props => {
  // console.log(props.imgs);
  const [imgIndex, setImgIndex] = useState(0);
  const handleCircleClick = e => {
    const id = Number(e.target.id);
    setImgIndex(id);
  };

  return (
    <div className="d-flex flex-column justify-content-center align-items-center mb-3">
      <CSSTransition
        key={imgIndex}
        in={true}
        appear={true}
        timeout={300}
        classNames="fade"
      >
        <img src={props.imgs[imgIndex]} alt={props.alt} className="product-img"/>
      </CSSTransition>
      <div className="d-flex justify-content-evenly col-8">
        {props.imgs.map((img, i) => <i key={i} id={i} onClick={handleCircleClick} className={`fa${i === imgIndex ? 's' : 'r'} fa-circle`} />)}
      </div>
    </div>
  );
};

export default Carousel;
