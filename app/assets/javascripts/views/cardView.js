function CardView() {
}

CardView.prototype.setCardsDraggable = function() {
  var $card = $('.hand');

  $card.draggable();
};

CardView.prototype.setFaceUpDeckAsDroppable = function() {
  $(".face-up").droppable({
    drop: function(event, ui) {
      $(this).addClass("face-up-highlight");
    }
  });
};
