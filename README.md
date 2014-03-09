# Complex

A library to manipulate complex numbers in Elixir.

Create a complex number like this:

```Elixir
number = Complex.new(1,2)
1+2i
```

This will create a number with real part 1 and imaginary part 2.

You can do all kind of operations on this:

```Elixir
Complex.real(number)
1

Complex.size(number)
2.23606797749979

Complex.argument(number)
0.46364760900080615

Complex.add(number, Complex.new(1,2))
2+4i

```

You can find more use-cases in the doctests.

PRs welcomed!

Development
===========

Added a Guardfile for development. To get started:

    bundle install
    guard
