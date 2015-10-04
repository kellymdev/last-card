function CardModel() {
}

CardModel.prototype.submitTurn = function(url, cardId) {
  $.ajax({
    type: 'post',
    url: url,
    data: { placed_card: { id: cardId } }
  }).done(function(response) {
    console.log(response);
  });
};