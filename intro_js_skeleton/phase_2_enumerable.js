Array.prototype.myEach = function(callback) {
  for (let i=0; i<this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function (callback) {
  const newArray = [];
  for (let i = 0; i < this.length; i++) {
    newArray.push(callback(this[i]));
  }
  return newArray;
};

Array.prototype.myReduce = function (callback, initialValue) {
  for (let i=0; i < this.length; i++) {
    if (!initialValue && i === 0) {
      initialValue = this[0];
      continue;
    }
    initialValue = callback(initialValue, this[i]);
  }
  return initialValue;
};

// let x = [1,2,3,4];
//
// x.myReduce(function(acc, el) {
//   return acc * el;
// }, 2);
