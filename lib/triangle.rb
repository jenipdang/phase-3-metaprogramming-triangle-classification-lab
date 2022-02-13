# class Triangle
#   attr_reader :a, :b, :c
  
#   def initialize(a, b, c)
#     @a = a
#     @b = b
#     @c = c
#   end

#   def kind
#     validate_triangle
#     if a == b && b == c
#       :equilateral
#     elsif a == b || b == c || a == c
#       :isosceles
#     else
#       :scalene
#     end
#   end

#   def sides_greater_than_zero?
#     [a, b, c].all?(&:positive?)
#   end

#   def valid_triangle_inequality?
#     a + b > c && a + c > b && b + c > a
#   end

#   def validate_triangle
#     raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
#   end

#   class TriangleError < StandardError
#   end

# end

class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c

    # raises an error for triangles violating triangle inequality
    if a >= (b + c) || b >= (a + c) || c >= (a + b)
      raise TriangleError
    end

    #raises an error for triangles with negative sides
    if a <= 0 || b <= 0 || c <= 0
      raise TriangleError
    end

    #raises an error for triangles wite no size
    if a == nil || b == nil || c == nil 
      raise TriangleError
    end
  end

  def kind
    if a == b && a == c
      :equilateral
    elsif a == b || b == c || c == a
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    def message 
      "This is not a valid triangle."
    end
  end

end

