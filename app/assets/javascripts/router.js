$(document).ready(function() {
  var cardController = new CardController();

  cardController.makeCardsDraggable();

  $('.player-hand').on('mousedown', '.card.hand', function() {
    cardController.makeDeckDroppable();
  });
});
