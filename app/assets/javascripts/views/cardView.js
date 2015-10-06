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

CardView.prototype.addDroppableToDeck = function(onDropFunction, successFunction, errorFunction) {
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
      onDropFunction(url, cardId, successFunction, errorFunction);
    }
  });
};

CardView.prototype.displayNewCards = function(data) {
  $('.placed').css({ display: "none" });
  $('.face-up').css({ display: "none" });
  $('.face-up').removeClass('face-up');

  var deckCardHtml = '<div class="card ' + data.card_for_deck.suit + ' value' + data.card_for_deck.value + ' face-up' + '">' +
      data.card_for_deck.value + ' ' + data.card_for_deck.suit +
    '</div>';

  $('.deck-cards').append(deckCardHtml);

  var playerCardHtml = '<div id="' + data.card_for_player.deck_card_id + '" class="card ' + data.card_for_player.suit + ' value' + data.card_for_player.value + ' hand">' +
    data.card_for_player.value + ' ' + data.card_for_player.suit +
    '</div>';

  $('.player-hand').append(playerCardHtml);
};

CardView.prototype.displayInvalidTurnError = function(errorMessage) {
  console.log(errorMessage);
};