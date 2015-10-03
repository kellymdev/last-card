function CardView() {
}

CardView.prototype.addDraggableToCards = function() {
  var $card = $('.hand');

  $card.draggable();
};

CardView.prototype.addDroppableToDeck = function() {
  $(".face-up").droppable({
    over: function(event, ui) {
      $(this).addClass("face-up-highlight");
    },
    out: function(event, ui) {
      $(this).removeClass("face-up-highlight");
    }
  });
};
