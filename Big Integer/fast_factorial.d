import std.stdio;
import std.bigint;
import std.math : pow;
import Math.sieve_of_erasthosthenes : sieve_of_erasthosthenes;

ulong index(ulong p, ulong n) {
    ulong index = 0;
    ulong i = 1;
    ulong quot = n / p;

    while (quot > 0) {
        index += quot;
        i += 1;
        quot = n / cast(ulong)pow(cast(real)p, cast(real)i);
    }

    return index;
}

BigInt fast_factorial(ulong n) {
    if (n == 0 || n == 1) {
        return BigInt(1);
    }

    // Get all primes up to n
    ulong[] primes = sieve_of_erasthosthenes(n);
    
    // Calculate n! by multiplying p^index(p, n) for all primes p
    BigInt result = BigInt(1);
    foreach (p; primes) {
        ulong exp = index(p, n);
        result *= BigInt(p) ^^ exp;  // need to use ^^ for exponentiation for bigints
    }
    
    return result;
}

unittest {
    // basic factorials
    assert(fast_factorial(0) == BigInt(1));
    assert(fast_factorial(1) == BigInt(1));
    assert(fast_factorial(2) == BigInt(2));
    assert(fast_factorial(3) == BigInt(6));
    assert(fast_factorial(4) == BigInt(24));
    assert(fast_factorial(5) == BigInt(120));
    assert(fast_factorial(10) == BigInt(3_628_800));
    
    // larger factorial
    assert(fast_factorial(20) == BigInt("2432902008176640000"));
}

void main() {
    writeln("5! = ", fast_factorial(5));
    writeln("10! = ", fast_factorial(10));
    writeln("20! = ", fast_factorial(20));
    writeln("50! = ", fast_factorial(50));
    writeln("100! = ", fast_factorial(100));
}
