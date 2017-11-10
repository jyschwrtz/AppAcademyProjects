import React from 'react';

class Clock extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    };
  }

  tick() {
    this.setState({ time: new Date() });
    // console.log(this.state.time);
  }

  componentDidMount() {
    this.second = setInterval(this.tick.bind(this), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.second);
    this.second = 0;
  }

  render() {
    const time = this.state.time;
    return (
      <section className="clock">
        <h1>Clock</h1>
        <div className="clock-box">
          <div className="clock-time">
            <h1>Time:</h1>
            <h1>{time.getHours()}:{time.getMinutes()}:{time.getSeconds()}</h1>
          </div>
          <div className="clock-date">
            <h1>Date:</h1>
            <h1>{time.toLocaleString('en-us', { weekday: 'short'})} {time.toLocaleString('en-us', {month: 'short'})} {time.getDay()} {time.getFullYear()}</h1>
          </div>
        </div>
      </section>
    );
  }
}

export default Clock;
