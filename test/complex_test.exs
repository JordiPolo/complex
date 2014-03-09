defmodule ComplexTest do
  use ExUnit.Case

  test "power with real exponent" do
    assert inspect(Complex.power(Complex.new(3, 3), 2)) == "0.0+18.0i"
    assert inspect(Complex.power(Complex.new(3, 3), 0)) ==  "1.0+0.0i"
    assert inspect(Complex.power(5, 2))                 == "25.0+0.0i"
  end

  test "power with complex exponent" do
    assert inspect(Complex.power(:math.pi, Complex.new(1, 1))) == "1.2983954757313+2.86072955549i"
  end
end
