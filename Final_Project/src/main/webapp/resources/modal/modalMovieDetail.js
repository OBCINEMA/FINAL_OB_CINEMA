// Get the modal
var modal2 = document.getElementById('myModalMovieDetail');
 
// Get the <span> element that closes the modal
var span2 = document.getElementById("myModalMovieDetail-close");                                          
 
// When the user clicks on <span> (x), close the modal
span2.onclick = function() {
    modal2.style.display = "none";
}
 
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal2) {
			modal2.style.display = "none";
	}
}