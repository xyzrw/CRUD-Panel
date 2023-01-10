const tabs = document.querySelectorAll('[data-tab-target]')
const tabContents = document.querySelectorAll('[data-tab-content]')

tabs.forEach(tab => {
  tab.addEventListener('click', () => {
    const target = document.querySelector(tab.dataset.tabTarget)
    tabContents.forEach(tabContent => {
      tabContent.classList.remove('active')
    })
    tabs.forEach(tab => {
      tab.classList.remove('active')
    })
    tab.classList.add('active')
    target.classList.add('active')
  })
})

// function sendRequest(typeName) {
//   const http = new XMLHttpRequest()
//
//   http.open("GET", "/config?mName='" + typeName + "'")
//   http.send()
//   // http.onload = () => console.log(http.responseText)
// }


// $(document).on("click", "#btn-fetch", function() {
//   $.get("config", function(responseJson) {
//     $.each(responseJson, function(index, item) {
//       $("#name-txt").val(item);
//       $("#r-date-txt").val(item);
//       $("#rating-txt").val(item);
//       $("#desc-txt").val(item);
//       console.log(item);
//       // $("#mNameTxt").val(item);
//     });
//   });
// });