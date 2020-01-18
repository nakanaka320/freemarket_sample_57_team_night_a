$(document).on('turbolinks:load', function() {
  var form = $("#charge_form");
  Payjp.setPublicKey('pk_test_2f3267d7a46c54ed06589124');
  $(document).on("click", "#token_submit", function(e) {

    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
        number: $("#card_number").val(),
        cvc: $("#cvc").val(),
        exp_month: $("#exp_month").val(),
        exp_year: $("#exp_year").val(),
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert('トークン作成エラー発生');
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        var token = response.id;

        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      }
    });
  });
});
