#O(n!)
def first_anagram?(str1, str2)
  str1.split("").permutation.to_a.map(&:join).include?(str2)
end

def second_anagram?(str1, str2)

  dup1 = str1.split("")
  dup2 = str2.split("")


  str1.split("").each_with_index do |letter1, idx1|
    dup2.each_with_index do |letter2, idx2|
      if letter1 == letter2
        dup1.delete_at(idx1)
        dup2.delete_at(idx2)
      end
    end
  end
  p "Dup1"
  p dup1
  p "Dup2"
  p dup2

  if dup2.empty?
    return true
  else
    false
  end

end

def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def fourth_anagram?(str1, str2)
  count = Hash.new(0)


  str1.split("").each do |letter|
    count[letter] += 1
  end

  str2.split("").each do |letter|
    count[letter] -= 1
  end

  count.all? { |k, v| v == 0 }
end


p fourth_anagram?("elvis", "lives")
p fourth_anagram?("gizmo", "sally")
