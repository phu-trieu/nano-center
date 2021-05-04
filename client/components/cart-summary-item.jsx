import React from 'react';

const CartSummaryItem = props => {
  return (
    <div className="d-flex cart-item-border">
      <img className="cart-img me-2" src={props.image} alt={props.name}/>
      <div className="cart-info ">
        <div>{props.name}</div>
        <div>{`$${(props.price / 100).toFixed(2)}`}</div>
        <i onClick={() => props.deleteCartItem(props.cartItemId)} className="delete fas fa-trash-alt" title="Delete item"></i>
      </div>
    </div>
  );
};

export default CartSummaryItem;
