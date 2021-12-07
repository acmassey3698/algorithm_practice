# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
# Roman numerals are as follows
# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000

# For example, 2 is written as II in Roman numeral, just two one's added together
# 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
#
# Roman numerals are usually written largest to smallest from left to right.
# However, the numeral for four is not IIII. Instead, the number four is written
# as IV. Because the one is before the five we subtract it making four. The same
# principle applies to the number nine, which is written as IX. There are six
#instances where subtraction is used:
#
# I can be placed before V (5) and X (10) to make 4 and 9.
# X can be placed before L (50) and C (100) to make 40 and 90.
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given a roman numeral, convert it to an integer.

## MY PLANNING
# Create an accumulator value to add the value to.
# Have a hash where each letter is a key and its value is provided
# If a the value of a character is less than the value to the right of it
# follow another path to get the correct subtracted value
# after getting that subtracted value, remove the second character 'L' in 'XL'
# so that the each block does not calculate the value of that in the final
# the last character will always count for its full value and will not be subtracted

def translations
  {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000,
  }
end

def valid_subtractions
  {
   "IV" => 4,
   "IX" => 9,
   "XL" => 40,
   "XC" => 90,
   "CD" => 400,
   "CM" => 900,
  }
end

def roman_to_int(s)
  total = 0
  chars = s.split('')

  chars.each_with_index do |char, i|
    if i == (chars.length - 1)
      total += translations[char]
    elsif translations[char] >= translations[chars[i + 1]]
      total += translations[char]
    else
      pair = [char, chars[i + 1]].join
      total += valid_subtractions[pair]
      chars.delete_at(i + 1)
    end
  end
  total
end

string1 = 'III'
string2 = "IV"
string3 = "IX"
string4 = "LVIII"
string5 = "MCMXCIV"

puts roman_to_int(string1) #expect return value of 3
puts roman_to_int(string2) #expect return value of 4
puts roman_to_int(string3) #expect return value of 9
puts roman_to_int(string4) #expect return value of 43
puts roman_to_int(string5) #expect return value of 1994
