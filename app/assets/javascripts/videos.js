var player = videojs('vid1');
player.play();

var play_button = document.getElementsByClassName("vjs-big-play-button")[0];
play_button.onclick = function() { updateVideoView()};

function updateVideoView() {
  var value = document.getElementById("show-id-value").value;
  axios.get('https://netshowme0002231.herokuapp.com/videos/'+ value +'/view')
    .then(function (response) {
      console.log("ok!")
      console.log(response);
    })
    .catch(function (error) {
      console.log(error);
    })
}



