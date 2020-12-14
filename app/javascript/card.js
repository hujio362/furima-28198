const pay = () => {
  Payjp.setPublicKey("pk_test_9af729190b04774872fc6ed9");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

      const formResult = document.getElementsById("charge-form");
      const formData = new FormData(formResult);

      const card = {
        number: formData.get("order[card-number]"),
        cvc: formData.get("order[card-cvc]"),
        exp_month: formData.get("order[card-exp_month]"),
        exp_year: `20${formData.get("order[card-exp_year]")}`,
      };

      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          // console.log(token)
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden>`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
          // debugger;
        }

        document.getElementById("order_card_number").removeAttribute("name");
        document.getElementById("order_cvc").removeAttribute("name");
        document.getElementById("order_exp_month").removeAttribute("name");
        document.getElementById("order_exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
      })
  });
};

window.addEventListener("load", pay);