## Arrays
1. Specify which aspect (or aspects) of the input the time complexity depends on. E.g., if a function is O(n), what is n?
2. Explain thoroughly and clearly why the time complexity is what it is.
3. Find the worst cases.
4. Discuss space complexity too: this is usually deemphasized over time complexity, but some interviewers will ask about it.

#### Problem 1
```
def add(a, b)
  if a > b
    return a + b
  end

  a - b
end
```
Time Complexity: O(1)  ---  Constant

#### Problem 2
```
def print_arr_1(arr)
  arr.each do |idx|
    puts el
  end
end
```
Time Complexity: O(n) --- Linear
Dependent on the length of the array (n)

#### Problem 3
```
def print_arr_2(arr)
  arr.each_with_index do |el, idx|
    break if idx == arr.length/2 - 1
    puts el
  end
end
```
Time Complexity: O(n) --- Linear
Time increases linearly with n.  Actual time is n / 2 where n is arr.length
Examples: arr.length === 10 => breaks at idx === 4
          arr.length === 20 => breaks at idx === 9
          arr.length === 40 => breaks at idx === 19
          arr.length === 50 => breaks at idx === 24

#### Problem 4
```
def print_arr_3(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end
end
```
Time Complexity: O(n) --- Linear
Best Case: If first el === arr.length/2 - 1, O(1)
Worst Case: O(n) --- traverses entire array

#### Problem 5
```
def print_arr_4(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end

  arr.each_with_index do |el, idx|
    puts el if idx % 3 == 0
  end

  puts arr.last
end
```
Time Complexity: O(n) --- Linear --- n === arr.length
The first time through it may break early, so that could be anywhere from O(1) to O(n).
The second time through it has to check every number, even if it doesn't print, so that adds another O(n)
Total comes out to O(2n), which reduces to O(n)

#### Problem 6
```
def search(arr, target)
  arr.each_with_index do |el, idx|
    return idx if el == target
  end
end
```
Time Complexity: O(n) --- Linear --- n = arr.length
Best Case: O(1)
Worst Case: O(n)

#### Problem 7
```
def searchity_search(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, target + el)
  end

  results  
end
```
Time Complexity: O(n^2)
Best Case: O(n) if each search is O(1)

#### Problem 8
```
def searchity_search_2(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, el)
  end

  results  
end
```
Time Complexity: O(n * log(n))
It must traverse the entire array because of the first .each.  Within each search though it is going to find the el, once at each position in the array.
