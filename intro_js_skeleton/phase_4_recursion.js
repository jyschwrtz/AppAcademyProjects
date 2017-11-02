const range = function (start, end) {
  const newArray = [start];
  if (start === end) {
    return [start];
  }
  return newArray.concat(range(start+1, end));

};

const sumRec = function (arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  return arr[0] + sumRec(arr.slice(1));
};

const exponent1 = function (base, exp) {
  if (exp === 0) {
    return 1;
  }
  return base * exponent1(base, exp - 1);
};

const exponent2 = function (base, exp) {
  if (exp === 0) {
    return 1;
  } else if (exp === 1) {
    return base;
  } else if (exp % 2 === 0) {
    return Math.pow(exponent2(base, exp/2), 2);
  } else {
    return base * Math.pow(exponent2(base, (exp - 1)/2), 2);
  }
};

const fibonacci = function (n) {
  if (n === 1) {
    return [1];
  } else if (n === 2) {
    return [1, 1];
  } else {
    let arr = fibonacci(n - 1);
    return arr.concat([arr[arr.length - 1] + arr[arr.length - 2]]);
  }
};

const bsearch = function(arr, target) {
  let middle = Math.floor(arr.length / 2);
  if (arr[middle] === target) {
    return middle;
  } else if (arr.length === 1 && arr[0] !== target) {
    return -1;
  } else if (arr[middle] > target) {
    return bsearch(arr.slice(0, middle), target);
  } else if (arr[middle] < target) {
    return bsearch(arr.slice(middle + 1), target) + middle + 1;
  }
};

const mergeSort = function(arr) {
  if (arr.length <= 1) {
    return arr;
  } else {
    let left = mergeSort(arr.slice(0, Math.floor(arr.length / 2)));
    let right = mergeSort(arr.slice(Math.floor(arr.length / 2)));
    return mergeHelper(left, right);
  }
};

const mergeHelper = function(left, right) {
  const mergedArray = [];
  while (left.length > 0 && right.length > 0) {
    switch (left[0] >= right[0]) {
      case true:
        mergedArray.push(right.shift());
        break;
      case false:
        mergedArray.push(left.shift());
        break;
    }
  }
  return mergedArray.concat(left).concat(right);
};

const subSets = function (arr) {
   if (arr.length === 0) {
     return [arr];
   } else {
     let last = subSets(arr.slice(0, arr.length - 1));
     let current = [];
     last.forEach(el => {
       let x = el.slice();
       x.push(arr[arr.length - 1]);
       current.push(x);
     });
     return last.concat(current);
   }
};
