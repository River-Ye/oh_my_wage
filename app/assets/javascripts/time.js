window.onload = function() {
  startTimer()
};

function startTimer () {
  var logout_value = document.querySelector('#logout-timestamp')

  var deadline = new Date(logout_value.dataset.logoutTime)

  console.log('deadline', deadline);

  var x = setInterval(function() { 
    var now = new Date().getTime(); 
    var t = deadline - now; 
    var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60)); 
    var seconds = Math.floor((t % (1000 * 60)) / 1000); 

    console.log('minutes', minutes)
    console.log('seconds', seconds)

    if (minutes >=3 ) { 
      document.getElementById("timecount").innerHTML = ""
      // $('#timecount').hide()
    }
    else{
      document.getElementById("timecount").innerHTML =  minutes + "m " + seconds + "s "; 
    } 
  }, 1000); 
}