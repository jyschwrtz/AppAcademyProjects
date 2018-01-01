Array.prototype.bubbleSort = function() {
  let sorted = false;
  while (sorted === false) {
    sorted = true;
    for(let i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        let x = this[i];
        let y = this[i + 1];
        this[i + 1] = x;
        this[i] = y;
        sorted = false;
      }
    }
  }
  return this;

};

String.prototype.substrings = function() {
  const newArray = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
      newArray.push(this.slice(i, j));
    }
  }
  return newArray;
};
