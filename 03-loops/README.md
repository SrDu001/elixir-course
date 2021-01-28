# Exercises

1. f(n) = 1 + 2 + ... + n

2. For all n > 0,
    fibo(n) = 
    | fibo(n - 1) + fibo(n - 2), n > 2
    | 1, n = 1 or n = 2

3. Some function

f(a, b)
    | a == 0 or b == b  -> f(a - 1, b - 1) + 2 * a - 1
    | a == b            -> f(a - 1, b - 1) + 2 * a - 1
    | a > b             -> f(a - b, b) + f(b, b)
    | a < b             -> f(a, a) + f(b - a, a)

4. mcd or gcd (Greatest Common Divison)

    gcd(a, b) =
    | b == 0 -> a
    | b > a -> gcd(b,a)
    | else -> gcd(a - b, b)

5. Write a function that recieve a positive integer
and prints the following
´´´
1
01
101
0101
. ----
.
. ......1 #n lines
´´´