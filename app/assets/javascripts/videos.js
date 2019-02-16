var player = videojs('vid1');
player.play();

  var play_button = document.getElementsByClassName("vjs-big-play-button")[0];
play_button.onclick = function() { updateVideoView()};


function updateVideoView() {
console.log("teste");
  axios.get('http://localhost:3000/videos/2/view')
    .then(function (response) {
      console.log(response);
    })
    .catch(function (error) {
      console.log(error);
    })
  console.log("ok!")
}



