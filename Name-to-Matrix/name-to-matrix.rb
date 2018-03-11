## Link 
# https://www.codewars.com/kata/name-to-matrix
## Instructions
# Given a name, turn that name into a perfect square matrix (nested array with the amount of arrays equivalent to the length of each array).
# You will need to add periods to the end of the name, as necessary, to turn it into a matrix.
# Example: "Bill" ==> [["B", "i"], ["l", "l"]]
# Example: "Frank" ==> [["F", "r", "a"], ["n", "k", "."], [".", ".", "."]]
# If the name has a length of 0, return "name must be at least one letter"

require 'pry' # debug purpose using binding.pry
require 'test/unit' # units tests

def matrixfy(x)
  return "name must be at least one letter" if x.length == 0
  chars = x.chars
  matrix_size = Math.sqrt(chars.length).ceil
  uncompleted_matrix = chars.each_slice(matrix_size).to_a
  uncompleted_matrix << [] if uncompleted_matrix.length != matrix_size
  uncompleted_matrix.map{ |matrix_elment| matrix_elment.length != matrix_size ? matrix_elment + ('.' * (matrix_size - matrix_elment.size )).chars : matrix_elment }
end


class KataTest < Test::Unit::TestCase
  def test_if_kata_valid
    assert_equal("name must be at least one letter", matrixfy(""))
    assert_equal([["A"]], matrixfy("A"))
    assert_equal([["F", "r", "a"], ["n", "k", "l"], ["i", "n", "."]], matrixfy("Franklin"))
    assert_equal([["B", "e", "y"], ["o", "n", "c"], ["e", ".", "."]], matrixfy("Beyonce"))

    # diff function from minitest break the following test
    assert_equal([["a", "b", "c", 'd'], ["e", "f", "g", 'h'], ["i", "j", "."], ['.', '.', '.']],matrixfy("abcdefghij"))
  end
end
