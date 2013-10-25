defmodule Complex do

  defrecord Number, real: 0.0, i: 0.0
  @moduledoc """
    A naive implementation of complex numbers.
  """

  @doc """
  Creates a new complex number
  ## Examples
    iex> inspect Complex.new(1,2)
    "1+2i"
  """
  def new(r, i) do
    Number.new(real: r, i: i)
  end

  @doc """
  Converts a real number into a complex number
  ## Examples
    iex> inspect Complex.new(2)
    "2+0i"
  """
  def new(r) do
    #TODO: handle non-numeric types
    if is_complex(r) do
      r
    else
      Number.new(real: r, i: 0)
    end
  end

  @doc """
  checks if a number is complex
  ## Examples
    iex> Complex.is_complex(Complex.new(1,2))
    true

    iex> Complex.is_complex(3)
    false

    iex> Complex.is_complex("test")
    false
  """

  def is_complex(complex) when is_record(complex, Number) do
    complex.i != 0
  end

  def is_complex(_) do
    false
  end

  @doc """
  returns the real part of the complex number
  ## Examples
      iex> Complex.real(Complex.new(1,2))
      1

      iex> Complex.real(Complex.new(0,2))
      0

      iex> Complex.real(3)
      3
  """
  def real(complex) when is_record(complex, Number) do
    complex.real
  end

  def real(number) when is_number(number) do
    number
  end

  @doc """
  returns the imaginary part of the complex number
  ## Examples
      iex> Complex.imag(Complex.new(1,2))
      2

      iex> Complex.imag(Complex.new(2,0))
      0

      iex> Complex.imag(3)
      0
  """
  def imag(complex) when is_record(complex, Number)  do
    complex.i
  end

  def imag(number) when is_number(number) do
    0
  end

  @doc """
  Convenience function to return imaginary number
  """
  def i(complex) do
    imag(complex)
  end

  @doc """
  Adds two complex numbers
   ## Examples
      iex> inspect Complex.add(Complex.new(1,2), Complex.new(1,2))
      "2+4i"

      iex> inspect Complex.add(Complex.new(1,2), 5)
      "6+2i"

      iex> inspect Complex.add(1,3)
      "4+0i"
  """

  def add(x1, x2) do
    c1 = new(x1)
    c2 = new(x2)
    Number.new(real: c1.real + c2.real, i: c1.i + c2.i)
  end

  @doc """
  Substracts two complex numbers
   ## Examples
      iex> inspect Complex.substract(Complex.new(1,2), Complex.new(1,2))
      "0+0i"

      iex> inspect Complex.substract(Complex.new(1,2), 5)
      "-4+2i"

      iex> inspect Complex.substract(1,3)
      "-2+0i"
  """
  def substract(x1, x2) do
    c1 = new(x1)
    c2 = new(x2)
    Number.new(real: c1.real - c2.real, i: c1.i - c2.i)
  end

end



defimpl Inspect, for: Complex.Number do
  @doc """
  Represents a complex number as a string

   ## Examples
       iex> inspect(Complex.new(1, 2))
       "1+2i"
   """

  def inspect(complex, opts) do
    Kernel.inspect(Complex.real(complex), opts) <> "+" <> Kernel.inspect(Complex.i(complex), opts) <> "i"
  end
end

