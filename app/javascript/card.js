const { $ } = require("@rails/ujs");

const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  console.log(form)
  form.addEventListener("submit", (e) => {
    e.preventDefault();

      const formResult = document.getElementById("charge-form");
      console.log(formResult)
      const formData = new FormData(formResult);

      const card = {
        number: formData.get("user_order[number]"),
        cvc: formData.get("user_order[cvc]"),
        exp_month: formData.get("user_order[exp_month]"),
        exp_year: `20${formData.get("user_order[exp_year]")}`,
      };
      console.log(card)
      Payjp.createToken(card, (status, response) => {
        console.log(status)
        console.log(response)
        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById('charge-form');
          console.log(renderDom)
          const tokenObj = `<input value=${token} name='token' type="hidden">`;
          console.log(tokenObj)
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
          
        }

        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp-month").removeAttribute("name");
        document.getElementById("exp-year").removeAttribute("name");
        document.getElementById("charge-form").submit();
      })
  });
};   

window.addEventListener("load", pay);