exp

def complex_exponentiation(self, other)
  return Complex(1, 0) if other == 0
  other = other.real if other.imag == 0

  if is_complex?(other)
    r = Complex.abs(self)
    theta = Complex.arg(self)
    nr = Math.exp(other.real * log(r) - other.imag * theta)
    ntheta = theta * other.real + other.imag * Math.log(r)
    return Complex.polar(nr, ntheta)
  end
end


# static VALUE
# nucomp_expt(VALUE self, VALUE other)
# {
#   if (k_numeric_p(other) && k_exact_zero_p(other))
#     return f_complex_new_bang1(CLASS_OF(self), ONE);

#   if (k_rational_p(other) && f_one_p(f_denominator(other)))
#         other = f_numerator(other); /* c14n */

#     if (k_complex_p(other)) {
#       get_dat1(other);

#       if (k_exact_zero_p(other.imag))
#             other = other.real; /* c14n */
#     }

#   if (k_complex_p(other)) {
#     r = f_abs(self);
#     theta = f_arg(self);
#     nr = :math.exp(other.real * log(r) - other.imag * theta);
#     ntheta = theta * other.real + other.imag * log(r);
#     return f_complex_polar(CLASS_OF(self), nr, ntheta);
#   }

#   if (k_fixnum_p(other)) {
#     if (f_gt_p(other, ZERO)) {
#       VALUE x, z;
#       long n;

#       x = self;
#       z = x;
#       n = FIX2LONG(other) - 1;

#       while (n) {
#         long q, r;

#         while (1) {
#           get_dat1(x);

#           q = n / 2;
#           r = n % 2;

#           if (r)
#             break;

#           x = Complex.new(other.real * other.real - other.imag * other.imag, 2 * other.real * other.imag);
#           n = q;
#         }
#         z = z * x;
#         n--;
#       }
#       return z;
#     }
#     return f_expt(f_reciprocal(self), f_negate(other));
#   }

#   if (k_numeric_p(other) && f_real_p(other)) {
#     VALUE r, theta;

#     if (k_bignum_p(other))
#       rb_warn("in a**b, b may be too big");

#     r = f_abs(self);
#     theta = f_arg(self);

#     return f_complex_polar(CLASS_OF(self), f_expt(r, other), theta * other);
#   }
#   return rb_num_coerce_bin(self, other, id_expt);
# }

