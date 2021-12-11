# Re-implement flatten

## EXAMPLES
# [1] => [1]
# [[1]] => [1]
# [[1], [[2]]] => [1, 2]
# [1, [2,[3,4]]] => [1, 2, 3, 4]

## MY THOUGHTS

# This could be be very straight forward if I'm given an argument, n, of how many
# levels the array is nested

#since I am not totally sure how deeply I will need to reach in, I can check the
#class of each item in the array, then implement recursion if it's an Array
#This will allow it to go down an infinite number of levels if necessary, but it
#Will need to escape and return a value if it is not an array

# the method will need to start with a default argument of an empty array so array
# items can be shoveled into it when they are not arrays themselves


def flatten_array(array, result = [])
  array.each do |a|
    if a.class == Array
      flatten_array(a, result)
    else
      result << a
    end
  end
  result
end

print flatten_array([[1]])
print flatten_array([[1], [[2]]])
print flatten_array([1, [2,[3,4]]])
