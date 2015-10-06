describe("CardView", function() {
  var mockPage;
  var view;

  beforeEach(function() {
    mockPage = document.createElement('div');
    mockPage.id = "content";
    document.body.appendChild(mockPage);
    view = new CardView();
  });

  afterEach(function() {
    document.body.removeChild(mockPage);
  });

  describe("addDraggableToCards", function() {
    beforeEach(function() {
      var cardHtml = '<div class="hand">' +
                      '</div>';
      $('#content').append(cardHtml);
      view.addDraggableToCards();
    });

    it("adds the draggable class to the cards in the players hand", function() {
      expect($('.hand')).toHaveClass('ui-draggable');
    });

    it("allows the dragstart event to be triggered", function() {
      var spyEvent = spyOnEvent('.hand', "dragstart");
      $('.hand').trigger("dragstart");

      expect("dragstart").toHaveBeenTriggeredOn('.hand');
      expect(spyEvent).toHaveBeenTriggered();
    });

    it("allows the dragstop event to be triggered", function() {
      $('.hand').addClass('selected');

      var spyEvent = spyOnEvent('.hand', "dragstop");
      $('.hand').trigger("dragstop");

      expect("dragstop").toHaveBeenTriggeredOn('.hand');
      expect(spyEvent).toHaveBeenTriggered();
    });
  });

  describe("addDroppableToDeck", function() {
    beforeEach(function() {
      var deckHtml = '<div class="face-up">' +
                      '</div>';
      $('#content').append(deckHtml);
      view.addDroppableToDeck();
    });

    it("adds the ui-droppable class to the deck", function() {
      expect($('.face-up')).toHaveClass('ui-droppable');
    });

    it("allows the dropover event to be triggered", function() {
      var spyEvent = spyOnEvent('.face-up', "dropover");
      $('.face-up').trigger("dropover");

      expect("dropover").toHaveBeenTriggeredOn('.face-up');
      expect(spyEvent).toHaveBeenTriggered();
    });

    it("allows the dropout event to be triggered", function() {
      var spyEvent = spyOnEvent('.face-up', "dropout");
      $('.face-up').trigger("dropout");

      expect("dropout").toHaveBeenTriggeredOn('.face-up');
      expect(spyEvent).toHaveBeenTriggered();
    });

    it("allows the drop event to be triggered", function() {
      var spyEvent = spyOnEvent('.face-up', "drop");
      $('.face-up').trigger("drop");

      expect("drop").toHaveBeenTriggeredOn('.face-up');
      expect(spyEvent).toHaveBeenTriggered();
    });
  });

  describe("displayNewCards", function() {
    beforeEach(function() {
      var deckHtml = '<div class="deck-cards">' +
                    '<div class="card hearts value6 face-up">' +
                    '</div>' +
                  '</div>';
      $('#content').append(deckHtml);

      var placedCardHtml = '<div id="1" class="card hearts placed value10 hand">' +
          '10 hearts' +
        '</div>';
      $('#content').append(placedCardHtml);

      var playerHandHtml = '<div class="player-hand">' +
                            '</div>';
      $('#content').append(playerHandHtml);

      var data = {
                    "card_for_deck": {
                      "suit": "hearts",
                      "value": "10"
                    },
                    "card_for_player": {
                      "deck_card_id": 5,
                      "suit": "clubs",
                      "value": "2"
                    }
                  };
      view.displayNewCards(data);
    });

    it("hides the placed card", function() {
      expect($('.placed')).toBeHidden();
    });

    it("removes the .face-up class from the previous deck card", function() {
      expect($('.hearts.value6')).not.toHaveClass('.face-up');
    });

    it("hides the previous deck card", function() {
      expect($('.hearts.value6')).toBeHidden();
    });

    it("adds the previous played card to the deck", function() {
      expect($('.card.hearts.value10.face-up')).toBeInDOM();
    });

    it("adds the new card to the players hand", function() {
      expect($('.card.clubs.value2.hand')).toBeInDOM();
    });
  });
});
