(function() {
  $(function() {
    return $(".notice, .error").on("click", function(event) {
      return $(event.target).hide("slow");
    });
  });

}).call(this);
