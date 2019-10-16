window.onload = function() {console.log
  startTimer()
};

function startTimer () {
    var logout_value = document.querySelector('#logout-timestamp')

    var deadline = new Date(logout_value.dataset.logoutTime).getTime();
 
    console.log('deadline', deadline);

    var x = setInterval(function() { 
    var now = new Date().getTime();
    var t = deadline - now; 
    var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60)); 
    var seconds = Math.floor((t % (1000 * 60)) / 1000); 

    console.log('minutes', minutes)
    console.log('seconds', seconds)
    document.getElementById("timecount").innerHTML = minutes + "m " + seconds + "s "; 
    

    if (seconds < 0) { 
      clearInterval(x); 
      document.getElementById("timecount").innerHTML = "時間到";
    } 
  
}, 1000);
  
}
