(function() {
  const sun = document.getElementById('sun');

  let currentTime = new Date().getTime() / 1000; // in seconds

  function positionSun(sunLeft, sunTop) {
    sun.style.left = sunLeft + "%";
    sun.style.top = sunTop + "%";
  }

  function getSunsetSunrise(callback) {
    const xhr = new XMLHttpRequest(),
      method = "GET",
      url = 'http://api.openweathermap.org/data/2.5/weather?q=miami,us&APPID=c126e38e46ea8f2eb81fd28f3703b034';

    xhr.open(method, url, true);
    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        var responseJSON = JSON.parse(xhr.responseText);
        var sunrise = responseJSON.sys.sunrise;
        var sunset = responseJSON.sys.sunset;
        callback(sunrise, sunset);
      }
    }
    xhr.send(null);
  }

  function doMath(sunrise, sunset, callback) {
    const day = sunset - sunrise,
      noon = sunrise + (day/2),
      morning = noon - sunrise,
      afternoon = sunset - noon,
      sunriseToNow = currentTime - sunrise,
      nowToNoon = noon - currentTime,
      noonToNow = currentTime - noon;

    const sunLeft = (sunriseToNow / day) * 100;

    let sunTop;
    if (currentTime < noon) {
      // console.log("Good morning!");
      sunTop = (nowToNoon / morning) * 100;
    } else {
      // console.log("Good afternoon!");
      sunTop = (noonToNow / afternoon) * 100;
    }

    callback(sunLeft, sunTop);
  }

  function animate(callback) {
    setInterval(callback, 3000);
  }

  // synchronous
  // var sunset, sunrise = getSunsetSunrise();
  // var sunTop, sunLeft = doMath(sunset, sunrise);
  // positionSun(sunTop, sunLeft);

  // asynchronous
  animate(function() {
    // debugging
    // currentTime = currentTime - 1*60*60; // 1 hour

    getSunsetSunrise(function(sunrise, sunset) {
      // doMath(sunrise, sunset, positionSun);
      doMath(sunrise, sunset, function(sunLeft, sunTop) {
        positionSun(sunLeft, sunTop);
      });
    });
  });

})();
