import std.stdio;
import std.math : abs;

uint sumDigitsIterative(int num) {
    uint result = 0;
    uint numT = num.abs;

    if (numT < 10) {
        return numT;
    }

    while (numT > 0) {
        result += numT % 10;
        numT /= 10;
    }

    return result;
}

uint sumDigitsRecursive(int num) {
    uint numT = num.abs;

    if (numT < 10) {
        return numT;
    }

    return numT % 10 + sumDigitsRecursive(cast(uint)(numT/10));
}

unittest {
    // iterative tests
    {
        assert(sumDigitsIterative(0) == 0);
    }

    {
        assert(sumDigitsIterative(1) == 1);
        assert(sumDigitsIterative(1234) == 10);
        assert(sumDigitsIterative(1075) == 13);
        assert(sumDigitsIterative(2236) == 13);
    }

    {
        assert(sumDigitsIterative(-1) == 1);
        assert(sumDigitsIterative(-246) == 12);
        assert(sumDigitsIterative(-11) == 2);
        assert(sumDigitsIterative(-42_161) == 14);
    }

    {
        assert(sumDigitsIterative(10_000) == 1);
        assert(sumDigitsIterative(30_000_000) == 3);
    }

    // recursive test
    {
        assert(sumDigitsRecursive(0) == 0);
    }

    {
        assert(sumDigitsRecursive(1) == 1);
        assert(sumDigitsRecursive(1234) == 10);
        assert(sumDigitsRecursive(1075) == 13);
        assert(sumDigitsRecursive(2236) == 13);
    }

    {
        assert(sumDigitsRecursive(-1) == 1);
        assert(sumDigitsRecursive(-246) == 12);
        assert(sumDigitsRecursive(-11) == 2);
        assert(sumDigitsRecursive(-42_161) == 14);
    }

    {
        assert(sumDigitsRecursive(10_000) == 1);
        assert(sumDigitsRecursive(30_000_000) == 3);
    }
    
}

void main() {
    writeln("Hello");
}
