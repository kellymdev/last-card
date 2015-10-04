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
      spyEvent = spyOnEvent('.hand', "dragstart");
      $('.hand').trigger("dragstart");

      expect("dragstart").toHaveBeenTriggeredOn('.hand');
      expect(spyEvent).toHaveBeenTriggered();
    });

    it("allows the dragstop event to be triggered", function() {
      $('.hand').addClass('selected');

      spyEvent = spyOnEvent('.hand', "dragstop");
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
      spyEvent = spyOnEvent('.face-up', "dropover");
      $('.face-up').trigger("dropover");

      expect("dropover").toHaveBeenTriggeredOn('.face-up');
      expect(spyEvent).toHaveBeenTriggered();
    });

    it("allows the dropout event to be triggered", function() {
      spyEvent = spyOnEvent('.face-up', "dropout");
      $('.face-up').trigger("dropout");

      expect("dropout").toHaveBeenTriggeredOn('.face-up');
      expect(spyEvent).toHaveBeenTriggered();
    });
  });
});
