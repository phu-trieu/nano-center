import React, { useEffect, useState } from 'react';
import Modal from 'react-modal';
import { CSSTransition } from 'react-transition-group';

const ZoomModal = ({ showModal, setShowModal, imgs, imgIndex, setImgIndex }) => {
  const [zoomImgIndex, setZoomImgIndex] = useState(imgIndex);
  const [fadeFwd, setFadeFwd] = useState(true);

  const customStyles = {
    content: {
      top: '50%',
      left: '50%',
      right: 'auto',
      bottom: 'auto',
      width: '95%',
      height: '95%',
      transform: 'translate(-50%, -50%)',
      display: 'grid',
      gridTemplateRows: '0.05fr 0.9fr 0.05fr',
      padding: '5px'
    }
  };

  const handleLeftArrowClick = () => {
    setFadeFwd(false);
    if (zoomImgIndex === 0) {
      return setZoomImgIndex(imgs.length - 1);
    }
    setZoomImgIndex(prevIndex => prevIndex - 1);
  };

  const handleRightArrowClick = () => {
    setFadeFwd(true);
    if (zoomImgIndex === imgs.length - 1) {
      return setZoomImgIndex(0);
    }
    setZoomImgIndex(prevIndex => prevIndex + 1);
  };

  const handleModalClose = () => {
    setShowModal(false);
    setZoomImgIndex(imgIndex);
  };

  /** Whenever imgIndex changes, change zoomImgIndex so modal opens up to correct img */
  useEffect(() => {
    setZoomImgIndex(imgIndex);
  }, [imgIndex]);

  return (
    <div>
      <Modal
        isOpen={showModal}
        style={customStyles}
        onRequestClose={handleModalClose}
        id="zoom-modal"
      >
        <div className="modal-info-grid">
          <i onClick={handleModalClose} className="cursor-pointer fas fa-times fs-2 align-self-start justify-self-end"></i>
        </div>
        <div className="modal-img-grid">
          <i onClick={handleLeftArrowClick} className="cursor-pointer fas fa-arrow-circle-left"></i>
          <CSSTransition
            key={zoomImgIndex}
            in={true}
            appear={true}
            timeout={300}
            classNames={fadeFwd ? 'fade-next' : 'fade-back'}
          >
            <img className="align-self-center" src={imgs[zoomImgIndex]} alt="" />
          </CSSTransition>
          <i onClick={handleRightArrowClick} className="cursor-pointer fas fa-arrow-circle-right"></i>
        </div>
        <div>
          <h5 className="secondary-font text-center">{`${zoomImgIndex + 1}/${imgs.length}`}</h5>
        </div>
      </Modal>
    </div>
  );
};

export default ZoomModal;
