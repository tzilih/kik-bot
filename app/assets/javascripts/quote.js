$('document').ready(function () {
  getQuote = function() {
    $.get('/get-quote', function(quote){
      renderQuote(quote);
    })
  }
  renderQuote = function(quoteData) {
    $('em').html(quoteData);
  }
  $('button').click(getQuote);
})