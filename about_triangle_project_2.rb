require File.expand_path(File.dirname(__FILE__) + '/neo')

require './triangle.rb'

class AboutTriangleProject2 < Neo::Koan
  def test_illegal_triangles_throw_exceptions
    assert_raise(TriangleError) do triangle(0, 0, 0) end
    assert_raise(TriangleError) do triangle(3, 4, -5) end
    assert_raise(TriangleError) do triangle(1, 1, 3) end
    assert_raise(TriangleError) do triangle(2, 4, 2) end
  end
  def triangle(a, b, c)
    raise TriangleError, "impossible triangle" if [a,b,c].min <= 0
    x, y, z = [a,b,c].sort
    raise TriangleError, "no two sides can be < than the third" if x + y <= z

    if a == b && b == c
        :equilateral
    elsif a == b || b == c || c == a
        :isosceles
    else
        :scalene
    end
end 
end
