function CardController() {
  this.cardModel = new CardModel();
  this.cardView = new CardView();
}

CardController.prototype.makeCardsDraggable = function() {
  this.cardView.setCardsDraggable();
};

CardController.prototype.setFaceUpDeckAsDroppable = function() {
  $(".face-up").droppable({
    drop: function() {
      $(this).addClass("face-up-highlight");
    }
  });
}
