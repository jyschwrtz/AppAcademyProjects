## Recursion
1. Find the time complexity of one call, ignoring the recursive calls,
2. Find the number of times the function is called, and, if necessary, the input sizes on all of those calls.
3. Sum everything together.

#### Problem 1
```
def rec_mystery(n)
  return n if n < 5

  rec_mystery(n - 5)
end
```
Time Complexity: O(n)
FFS:  First time - O(1)
      Called n / 5 times
      O(n/5)

#### Problem 2
```
def rec_mystery_2(n)
  return 0 if n == 0

  rec_mystery_2(n/5) + 1
end
```
Time Complexity: O(log_5(n))
FFS:  First Time - O(2)
      Called log_5(n)

#### Problem 3
```
void rec_mystery_3(int n, int m, int o)
{
  if (n <= 0)
  {
    printf("%d, %d\n", m, o);
  }
  else
  {
    rec_mystery_3(n-1, m+1, o);
    rec_mystery_3(n-1, m, o+1);
  }
}
```
Time Complexity: O(n)

#### Problem 4
```
class Array
  def grab_bag
    return [[]] if empty?
    bag = take(count - 1).grab_bag
    bag.concat(bag.map { |handful| handful + [last] })
  end
end
```
Time Complexity: O(n * log(n)) ??  n === self.length
Example:
    [1, 2, 3, 4].grab_bag
    bag = self.take(3).grab_bag => bag = [1, 2, 3].grab_bag

      bag = [1, 2].grab_bag

        bag = [1].grab_bag

          bag = [].grab_bag
          return [[]]

          bag = [[]]
          [[]].concat([[]].map { |h| h + self.last }) => [[], [1]]

        bag = [[], [1]]
        [[], [1]].concat([[], [1]].map {...}) => [[], [1], [2], [1, 2]]

      bag = [ [], [1], [2], [1, 2] ]
      [ [], [1], [2], [1, 2] ].concat([ [], [1], [2], [1, 2] ]
        .map {...}) => [ [], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3] ]
