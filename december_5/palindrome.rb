# A phrase is a palindrome if, after converting all uppercase letters into lowercase
#  letters and removing all non-alphanumeric characters, it reads the same forward
#   and backward. Alphanumeric characters include letters and numbers.
#
# Given a string s, return true if it is a palindrome, or false otherwise.

# @param {String} s
# @return {Boolean}

# First I want to downcase the string
# second I should remove any spaces or invalid characters from the string
# Third I want to split the string at "" so that it is an array of all the characters
# Create an empty array where there the letters are shoveled into in reverse order
# compare the two arrays
require 'pry'

string1 = 'A man, a plan, a canal: Panama'
string2 = 'andrew massey'
string3 = ' '

## method using unshift which is a ruby method
def is_palindrome(s)
  downcased = s.downcase
  alpha_nums = downcased.scan(/\w/)
  reversed = []

  alpha_nums.each do |a|
    reversed.unshift(a)
  end

  if alpha_nums == reversed
    true
  else
    false
  end
end

##uses a tracker and no specific ruby methods but it is a little longer
def is_palindrome2(s)
  downcased = s.downcase
  alpha_nums = downcased.scan(/\w/)
  reversed = []

  tracker = alpha_nums.length

  while tracker > 0
    reversed << alpha_nums[tracker - 1]
    tracker -=1
  end

  if reversed == alpha_nums
    true
  else
    false
  end
end

print is_palindrome(string1)
print is_palindrome(string2)
print is_palindrome(string3)
print is_palindrome2(string1)
print is_palindrome2(string2)
print is_palindrome2(string3)
