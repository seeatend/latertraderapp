document.addEventListener("turbolinks:load", function(){
  var country = document.getElementById("seller_country");
  var state = document.getElementById("seller_state");

  country.addEventListener("change", function(){
    Rails.ajax({
      url: "/states?country=" + country.value,
      type: "GET"
    })
  })

  
})
