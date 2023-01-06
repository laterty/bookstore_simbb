function useBillingAddress(){
  let check = document.getElementById('order_use_billing')
  let checkbox = document.getElementById('use-billing')
  let shipping_form = document.getElementById('shipping')
  let shipping_title = document.getElementById('shipping-title')

  checkbox.addEventListener('click', ()=>{
    if (check.value == 'false') {
      check.value = 'true'
      shipping_form.classList.add("hidden")
      shipping_title.classList.add("hidden")}
    else {
      check.value = 'false'
      shipping_form.classList.remove("hidden")
      shipping_title.classList.remove("hidden")
    }
  })
}

document.addEventListener("turbolinks:load", function() {
  useBillingAddress();
});
