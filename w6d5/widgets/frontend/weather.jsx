import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);

  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition((location) => this.getWeather(location));
  }

  getWeather(location) {
    const request = new XMLHttpRequest();
    request.open("GET", `https://api.openweathermap.org/data/2.5/weather?lat=${Math.floor(location.coords.latitude)}&lon=${Math.floor(location.coords.longitude)}&APPID=0e5861f715461a45b17a10ba1561acb4`)
    request.onload = function() {
      if (request.status >= 200 && request.status < 400) {
        var resp = request.responseText;
      }
    };
    console.log(request.responseText);
    request.send();
  }

  render() {
    return (
      <h1>Weather</h1>
    );
  }

}

export default Weather;
