var deadline = new Date("Oct 20, 2019 00:00:00").getTime();
var x = setInterval(function() { 
  var now = new Date().getTime(); 
  var t = deadline - now; 
  var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60)); 
  var seconds = Math.floor((t % (1000 * 60)) / 1000); 
  
  if (minutes <=3 ) { 
    document.getElementById("timecount").innerHTML = ""
    // $('#timecount').hide()
  }
  else{
    document.getElementById("timecount").innerHTML =  minutes + "m " + seconds + "s "; 
  } 
}, 1000); 



