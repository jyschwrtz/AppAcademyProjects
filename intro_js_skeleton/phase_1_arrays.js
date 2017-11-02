Array.prototype.uniq = function () {
  const newArray = [];
  this.forEach(function (el) {
    if (!newArray.includes(el)) {
      newArray.push(el);
    }
  });
  return newArray;
};

Array.prototype.twoSum = function () {
  const newArray = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let i2 = i + 1; i2 < this.length; i2++) {
      let sum = this[i] + this[i2];
      if (sum === 0) {
        newArray.push([i, i2]);
      }
    }
  }
  return newArray;
};

Array.prototype.transpose = function () {
  const newArray = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      if (i === 0) {
        newArray.push([this[i][j]]);
      } else {
        newArray[j].push(this[i][j]);
      }
    }
  }
  return newArray;
};
