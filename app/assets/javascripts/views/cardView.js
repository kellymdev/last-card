function CardView() {
}

CardView.prototype.addDraggableToCards = function() {
  $('.hand').draggable({
    start: function(event, ui) {
      $(this).addClass('selected');
      $(this).removeClass('placed');
    },
    stop: function(event, ui) {
      $(this).removeClass('selected');
    }
  });
};

CardView.prototype.addDroppableToDeck = function(onDropFunction) {
  $(".face-up").droppable({
    over: function(event, ui) {
      $(this).addClass('face-up-highlight');
    },
    out: function(event, ui) {
      $(this).removeClass('face-up-highlight');
    },
    drop: function(event, ui) {
      $('.selected').addClass('placed');
      var url = $(this).attr('href');
      var cardId = $(ui.helper).attr('id');
      onDropFunction(url, cardId);
    }
  });
};
