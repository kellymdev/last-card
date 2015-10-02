function CardView() {
}

CardView.prototype.setCardsDraggable = function() {
  var $card = $('.hand');

  $card.draggable();
};
