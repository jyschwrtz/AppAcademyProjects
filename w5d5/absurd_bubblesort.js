const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

const absurdBubbleSort = (arr, sortCompletionCallback) => {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (!madeAnySwaps) {
      sortCompletionCallback(arr);
    } else {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    }
  }
  outerBubbleSortLoop(true);
};

const askIfGreaterThan = (el1, el2, callback) => {
  reader.question(`Is ${el1} > ${el2}?`, function(res) {
    if (res === "yes") {
      callback(true);
    } else if (res === "no") {
      callback(false);
    } else {
      console.log("invalid answer");
      askIfGreaterThan(el1, el2, callback);
    }
  });
};

const innerBubbleSortLoop = (arr, i, madeAnySwaps, outerBubbleSortLoop) => {
  if (i === (arr.length - 1)) {
    console.log(arr);
    outerBubbleSortLoop(madeAnySwaps);
  } else {
    askIfGreaterThan(arr[i], arr[i + 1], function(isGreaterThan) {
      if (isGreaterThan) {
        const x = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = x;
        madeAnySwaps = true;
        // console.log(arr);
      } else {
        // madeAnySwaps = false;
        // console.log(arr);
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
    // console.log(i);
  }
};

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

// askIfGreaterThan(1, 5, (res) => {
//   console.log(res);
// });

// innerBubbleSortLoop([3, 2, 1, 4], 0, false, function () {
//   console.log("in outer bubble sort");
//   reader.close();
// });
