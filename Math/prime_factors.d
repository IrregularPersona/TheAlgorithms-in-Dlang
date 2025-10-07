import std.stdio;

uint[] primeFactors(uint n) {
    auto i = 2;
    uint[] factors;

    while (i * i <= n) {
        if (n % i != 0) {
            if (i != 2) {
                i += 1;
            }
            i += 1;
        } else {
            n /= i;
            factors ~= i;
        }
    }

    if (n > 1) {
        factors ~= n;
    }

    return factors;
}

unittest
{
    {
        assert(primeFactors(0) == []);
        assert(primeFactors(1) == []);
        assert(primeFactors(11) == [11]);
        assert(primeFactors(25) == [5, 5]);
        assert(primeFactors(33) == [3, 11]);
        assert(primeFactors(2560) == [2, 2, 2, 2, 2, 2, 2, 2, 2, 5]);
    }
}

void main() {
    writeln("Hello");
}
