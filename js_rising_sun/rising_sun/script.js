var message = 'Hello, cohort 13.';

window.onload = function() {
  var sun, 
      currentTime;
  console.log(message);
  makeAjaxRequest();

  function makeAjaxRequest() {
    console.log("Calling makeAjaxRequest.");
    var httpRequest = new XMLHttpRequest(),
      URL = [
        'http://api.openweathermap.org',
        '/data/2.5/weather',
        '?q=miami,us&APPID=c126e38e46ea8f2eb81fd28f3703b034',
      ].join('');
    httpRequest.onreadystatechange = function() {
      if (httpRequest.readyState === XMLHttpRequest.DONE) {
        console.log(httpRequest.responseText);
        sun = getSun(httpRequest.responseText);
      }
    }
    httpRequest.open('GET', URL, true);
    httpRequest.send(null);
  }

  function getSun(response) {
    var jsonResponse = JSON.parse(response),
        sunrise = jsonResponse.sys.sunrise,
        sunset = jsonResponse.sys.sunset;
    return {sunrise: sunrise, sunset: sunset, sunX: 0, sunY: 0};
  }

  function calculatePosition() {
    var currentTime = new Date().getTime() / 1000, // time since epoch in seconds
      sunriseToNow = currentTime - sun.sunrise,
      day = sun.sunset - sun.sunrise,
      noon = sun.sunrise + (day/2),
      morning = noon - sun.sunrise,
      afternoon = sun.sunset - noon,
      nowToNoon = noon - currentTime,
      noonToNow = currentTime - noon;
    // for debugging in console
    var attrs = [
        ['day', day],
        ['noon', noon],
        ['morning', morning],
        ['afternoon', afternoon],
        ['nowToNoon', nowToNoon],
        ['noonToNow', noonToNow],
        ['sunY', sun.sunY],
        ['sunX', sun.sunX],
    ],
        i = 0,
        length = attrs.length,
        attr = '';
    while (i < length){
        attr = attrs[i];
        console.log([attr[0], attr[1]].join(': '));
        i += 1
    }
    // end for debugging

    if (currentTime < noon) {
      console.log('It is morning.');
      sun.sunY =  (nowToNoon / morning) * 100;
    } else {
      console.log('It is afternoon.');
      sun.sunY = (noonToNow / afternoon) * 100;
    }

    sun.sunX = (sunriseToNow / day) * 100;
  }

  function positionSun() {
    var sunElement = document.getElementById('sun');
    console.log({x: sun.sunX, y: sun.sunY});
    sunElement.style.left = sun.sunX + "%";
    sunElement.style.top = sun.sunY + "%";
  }

// animate the sun
var animate = function(){
    setInterval(function() {
      calculatePosition();
      positionSun();
      }, 1000);
    }
animate();

}  // end of onload
