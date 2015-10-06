function CardModel() {
}

CardModel.prototype.submitTurn = function(url, cardId, successFunction, errorFunction) {
  $.ajax({
    type: 'post',
    url: url,
    data: { placed_card: { "id": cardId } }
  }).done(function(response) {
    successFunction(response);
  }).fail(function(response) {
    errorFunction(response);
  });
};
