// Get the modal
var modal3 = document.getElementById('myModalTheaterDetail');
 
// Get the <span> element that closes the modal
var span3 = document.getElementById("myModalTheaterDetail-close");                                          
 
// When the user clicks on <span> (x), close the modal
span3.onclick = function() {
    modal3.style.display = "none";
}
 
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal3) {
			modal3.style.display = "none";
	}
}