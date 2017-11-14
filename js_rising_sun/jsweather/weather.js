function weatherLoaded() {
  var weatherData = JSON.parse(this.responseText)

  var sunrise = weatherData.sys.sunrise;
  var sunset = weatherData.sys.sunset;
  var currentEpoc = new Date().getTime()/1000;

  var secondsSinceSunrise = currentEpoc-sunrise;
  var percentageOfDay = ((currentEpoc-sunrise)/(sunset-sunrise))*100;
  var highNoon = sunrise+((sunset-sunrise)/2);

  if (secondsSinceSunrise < highNoon) {
    var percentY = (secondsSinceSunrise/highNoon)*100;
  } else {
    var percentY = (highNoon/secondsSinceSunrise)*100;
  }







  console.log(sunrise);
  console.log(sunset);
  console.log(highNoon);
  console.log(percentageOfDay);

  var sun = document.getElementById("sun");
  sun.style.left = percentageOfDay+"%";
  sun.style.bottom = percentY+"%";

}


var weatherRequest = new XMLHttpRequest();

weatherRequest.addEventListener("load", weatherLoaded);
weatherRequest.open("GET", "http://api.openweathermap.org/data/2.5/weather?q=Ft.+Lauderdale,us&APPID=2dcaaa02d37712bccb0f40264325d9dd");
weatherRequest.send();
