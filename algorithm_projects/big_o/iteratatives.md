## Iterative

#### Problem 1
```
let iterative_1 = (n, m) => {
  let notes = ["do", "re", "mi", "fa", "so", "la", "ti", "do"];

  for (var i = 0; i < n; i++) {
    for (var j = 0; j < m; j++) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```
Time Complexity: O(n * m)

#### Problem 2
```
let iterative_2 = (n) => {
  let notes = ["do", "re", "mi", "fa", "so", "la", "ti", "do"];

  for (var i = 0; i < n; i++) {
    for (var j = i; j >= 0; j--) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```
Time Complexity: O(n * log(n))

Correct Answer: n * ( n + 1 ) / 2 ==> n^2

#### Problem 3
```
let iterative_3 = (n, m) => {
  let notes = ["do", "re", "mi", "fa", "so", "la", "ti", "do"];

  let bigger = n > m ? n : m;
  let smaller = n <= m ? n : m;

  for (var i = 0; i < smaller; i++) {
    for (var j = i; j < bigger; j++) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```
Time Complexity: O(n * (log(n) + (m - n))) where m > n
Examples: n = 3, m = 5 => 3 * (log(3) + 2)
          n = 2, m = 6 => 2 * (log(2) + 4)
