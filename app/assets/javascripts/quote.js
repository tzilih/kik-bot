$('document').ready(function () {
  getQuote = function() {
    $.get('/get-quote', function(quote){
      renderQuote(quote);
    })
  }
  renderQuote = function(quoteData) {
    $('p').html(quoteData);
  }
  $('button').click(getQuote);
})