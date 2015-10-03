function CardView() {
}

CardView.prototype.addDraggableToCards = function() {
  $('.hand').draggable({
    start: function(event, ui) {
      $(this).addClass('selected');
    }
  });
};

CardView.prototype.addDroppableToDeck = function() {
  $(".face-up").droppable({
    over: function(event, ui) {
      $(this).addClass('face-up-highlight');
    },
    out: function(event, ui) {
      $(this).removeClass('face-up-highlight');
    },
    drop: function(event, ui) {
      $('.selected').addClass('placed');
      $('.selected').removeClass('selected');
    }
  });
};
