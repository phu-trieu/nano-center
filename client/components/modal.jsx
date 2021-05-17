import React, { useState } from 'react';
import Modal from 'react-modal';

const ModalComp = ({ modalOpen, setModalOpen }) => {
  const customStyles = {
    content: {
      top: '50%',
      left: '50%',
      right: 'auto',
      bottom: 'auto',
      marginRight: '-50%',
      width: 'auto',
      maxWidth: '600px',
      height: 'auto',
      transform: 'translate(-50%, -50%)'
    }
  };

  const [acknowledged, setAcknowledged] = useState(true);

  const acknowledge = () => {
    setAcknowledged(prevState => !prevState);
  };

  const closeModal = () => {
    setModalOpen(false);
  };

  return (
    <Modal
      isOpen={modalOpen}
      style={customStyles}
    >
      <h1 className="main-font text-center">NOTICE</h1>
      <h5 className="secondary-font">
        This site is solely for demonstrative purposes. All products listed on
        the site cannot be purchased. No actual payment processing will be done.
        Do not input any of your personal information, such as your address,
        phone number, or credit card number.
      </h5>
      <div className="d-flex align-items-center">
        <input type="checkbox" onChange={acknowledge} name="modal-check" id="modal-check" className="me-2"/>
        <label htmlFor="modal-check" className="secondary-font">Check this box if you have read the above notice and acknowledge it.</label>
      </div>
      <div className="d-flex justify-content-center mt-5 secondary-font">
        <button className="btn btn-dark" onClick={closeModal} disabled={acknowledged}>Continue</button>
      </div>
    </Modal>
  );
};

export default ModalComp;
