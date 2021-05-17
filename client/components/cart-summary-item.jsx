import React from 'react';

const CartSummaryItem = props => {
  return (
    <div className="cart-item-border">
      <div className="cart-item hundo">
        <div className="cart-img-wrapper">
          <img className="cart-img me-2" src={props.image} alt={props.name}/>
        </div>
        <div className="cart-info">
          <div>{props.name}</div>
          <div>{`$${(props.price / 100).toFixed(2)}`}</div>
          <i onClick={() => props.deleteCartItem(props.cartItemId)} className="cursor-pointer fas fa-trash-alt" title="Delete item"></i>
        </div>
      </div>
    </div>
  );
};

export default CartSummaryItem;
