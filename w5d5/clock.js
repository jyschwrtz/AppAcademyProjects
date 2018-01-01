class Clock {
  constructor() {
    const startTime = new Date();
    this.hours = startTime.getHours();
    this.minutes = startTime.getMinutes();
    this.seconds = startTime.getSeconds();
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    // setInterval(() => this._tick(this.printTime.bind(this)), 1000);
    setInterval(() => this._tick(), 1000);
  }

  printTime() {
    const seconds = this._formatTime(this.seconds);
    const minutes = this._formatTime(this.minutes);
    const hours = this._formatTime(this.hours);
    console.log(`${hours}:${minutes}:${seconds}`);
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _formatTime(timeNum) {
    var formattedTime;
    if (timeNum < 10) {
      formattedTime = '0' + timeNum;
    } else {
      formattedTime = timeNum;
    }
    return formattedTime;
  }

  _tick() {
    this.seconds++;
    if (this.seconds === 60) {
      this.seconds = 0;
      this.minutes++;
    }
    if (this.minutes === 60) {
      this.minutes = 0;
      this.hours++;
    }
    if (this.hours === 24) {
      this.hours = 0;
    }
    // cb();
    this.printTime();
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }


}


const clock = new Clock();
