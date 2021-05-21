import React from 'react';
import Modal from 'react-modal';

const ZoomModal = ({ imgs, imgIndex, setImgIndex }) => {
  const customStyles = {
    content: {
      top: '50%',
      left: '50%',
      right: 'auto',
      bottom: 'auto',
      width: '97%',
      height: 'auto',
      transform: 'translate(-50%, -50%)',
      display: 'grid',
      gridTemplateRows: '1fr',
      gridTemplateColumns: '0.1fr 1.8fr 0.1fr'
    }
  };

  const handleLeftArrowClick = () => {
    if (imgIndex === 0) {
      return setImgIndex(imgs.length - 1);
    }
    setImgIndex(prevIndex => prevIndex - 1);
  };

  return (
    <div>
      <Modal
        isOpen={true}
        style={customStyles}
        id="zoom-modal"
      >
        <i onClick={handleLeftArrowClick} className="fas fa-arrow-circle-left"></i>
        <img src={imgs[imgIndex]} alt="" />
        <i className="fas fa-arrow-circle-right"></i>
      </Modal>
    </div>
  );
};

export default ZoomModal;
