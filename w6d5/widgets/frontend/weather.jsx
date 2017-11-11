import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = { weather: null };
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition((location) => this.getWeather(location));
  }

  getWeather(location) {
    const request = new XMLHttpRequest();
    request.open("GET", `https://api.openweathermap.org/data/2.5/weather?lat=${location.coords.latitude}&lon=${location.coords.longitude}&APPID=0e5861f715461a45b17a10ba1561acb4`);
    request.onload = () => {
      if (request.status >= 200 && request.status < 400) {
        var resp = JSON.parse(request.responseText);
        console.log(resp);
        this.setState({ weather: resp });
      }
    };
    request.send();
  }

  render() {
    let content;
    if (this.state.weather) {
      let tempK = this.state.weather['main']['temp'];
      let tempF = Math.round((9/4 * (tempK - 273) + 32)*10)/10;
      content =
        <div className="weather-box">
          <div className="weather-city">
            <h2>City:</h2>
            <h2>{this.state.weather['name']}</h2>
          </div>
          <div className="weather-description">
            <h3>Current Conditions:</h3>
            <h3>{this.state.weather['weather'][0]['description']}</h3>
          </div>
          <div className="weather-temperature">
            <h3>Temperature (F):</h3>
            <h3>{tempF}</h3>
          </div>
        </div>;
    } else {
      content =
        <div className="weather-box">
          <h2>Loading...</h2>
        </div>;
    }
//° F = 9/5 (K - 273) + 32
    return (
      <div className="weather-widget">
        <h1>Weather</h1>
        {content}
      </div>
    );
  }

}

export default Weather;
