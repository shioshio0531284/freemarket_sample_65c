$(document).on('turbolinks:load', ()=> {
  
  Payjp.setPublicKey("pk_test_60016bef2aecfbb50ebb65e4");
//まずはテスト鍵をセットする↑
  $("#submit_btn").on("click",function(e){
    e.preventDefault();
  //↑ここでrailsの処理を止めることでjsの処理を行う
    const card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val()
    };
   //↑Pay.jpに登録するデータを準備する
    Payjp.createToken(card,function(status,response){
   //↑先ほどのcard情報がトークンという暗号化したものとして返ってくる
      form.find("input[type=submit]").prop("disabled", true);
      if(status == 200){//←うまくいった場合200になるので
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#card_token").append(
          $('<input type="hidden" name="payjp-token">').val(response.id));
        document.inputForm.submit();
        alert("登録が完了しました");
      }else{
        alert("カード情報が正しくありません。");
      }
    });
  });
});
