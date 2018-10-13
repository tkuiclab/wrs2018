var modal = document.getElementById('myModal');
var btn = document.getElementById("myBtn");
var order = document.getElementById("sendOrder");
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}
// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
// order.onclick = function() {
//   console.log("Send Order");
//   var request = new ROSLIB.ServiceRequest({
//     state : 3
//   });
//   AssistantClient.callService(request, function(result) {
//     console.log('Result from server: '+result.success+', '+result.info);
//   });
// }