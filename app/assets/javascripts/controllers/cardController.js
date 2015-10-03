function CardController() {
  this.cardModel = new CardModel();
  this.cardView = new CardView();
}

CardController.prototype.makeCardsDraggable = function() {
  this.cardView.addDraggableToCards();
};

CardController.prototype.makeDeckDroppable = function() {
  this.cardView.addDroppableToDeck(this.cardModel.submitTurn);
};
