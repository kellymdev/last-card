function CardController() {
  this.cardModel = new CardModel();
  this.cardView = new CardView();
}

CardController.prototype.makeCardsDraggable = function() {
  this.cardView.setCardsDraggable();
};

CardController.prototype.makeDeckDroppable = function() {
  this.cardView.setFaceUpDeckAsDroppable();
};
