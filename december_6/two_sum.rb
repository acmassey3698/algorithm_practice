# Given an array of integers nums and an integer target, return indices of the
# two numbers such that they add up to target.
# You may assume that each input would have exactly one solution, and you may
# not use the same element twice.
# You can return the answer in any order.

## MY IDEAS

# create a hash where each value is subtracted from the target
# keep the index as the key of that subtracted value
# iterate through the numbers again and see if they match any of the values in
#the hash.
#If they do match a value in the hash, check to make sure that the indexes
# are not equal (we can add equivalent numbers but not the same number from the
#array).

nums1 = [2, 7, 5, 3, 1]
nums2 = [3, 2, 4]
nums3 = [3, 3]

def two_sum(nums, target)
  diffs = {}

  nums.each_with_index do |n, i|
    diff = target - n
    diffs[i] = diff
  end

  nums.each_with_index do |n, i|
    if diffs.values.include?(n) && i != diffs.key(n)
      return [diffs.key(n), i]
    end
  end
end

print two_sum(nums1, 9) #expect [1, 0]
print two_sum(nums2, 6) #expect [1, 2]
print two_sum(nums3, 6) #expect [0, 1]
