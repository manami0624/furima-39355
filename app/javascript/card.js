const pay = () => {
  const payjp = Payjp('pk_test_e27de5a160bc239cb9e7272f')// PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);
