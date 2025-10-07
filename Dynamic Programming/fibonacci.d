import std.stdio;
import std.math;
import std.bigint;

// since the u128 implementation is obsolete, we use the BigInts implementation instead.

// ulong can handle fibonacci up to F(93) without overflow
ulong fibonacci(uint n) {
    ulong a = 0;
    ulong b = 1;
    foreach(i; 0 .. n) {
        ulong c = a + b;
        a = b;
        b = c;
    }

    return a;
}

ulong recursive_fibonacci(uint n) {
    return _recursive_fibonacci(n, 0, 1);
}

ulong _recursive_fibonacci(uint n, ulong prev, ulong curr) {
    if (n == 0) {
        return prev;
    }

    return _recursive_fibonacci(n - 1, curr, curr + prev);
}

ulong classical_fibonacci(uint n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    
    uint k = n / 2;
    ulong f1 = classical_fibonacci(k);
    ulong f2 = classical_fibonacci(k - 1);
    
    switch (n % 4) {
        case 0:
        case 2:
            return f1 * (f1 + 2 * f2);
        case 1:
            return (2 * f1 + f2) * (2 * f1 - f2) + 2;
        default:  // case 3
            return (2 * f1 + f2) * (2 * f1 - f2) - 2;
    }
}

BigInt fibonacci_bigint(uint n) {
    BigInt a = 0;
    BigInt b = 1;
    foreach(i; 0 .. n) {
        BigInt c = a + b;
        a = b;
        b = c;
    }
    return a;
}

BigInt recursive_fibonacci_bigint(uint n) {
    return _recursive_fibonacci_bigint(n, BigInt(0), BigInt(1));
}

BigInt _recursive_fibonacci_bigint(uint n, BigInt prev, BigInt curr) {
    if (n == 0) {
        return prev;
    }
    return _recursive_fibonacci_bigint(n - 1, curr, curr + prev);
}

BigInt classical_fibonacci_bigint(uint n) {
    if (n == 0) return BigInt(0);
    if (n == 1) return BigInt(1);
    
    uint k = n / 2;
    BigInt f1 = classical_fibonacci_bigint(k);
    BigInt f2 = classical_fibonacci_bigint(k - 1);
    
    switch (n % 4) {
        case 0:
        case 2:
            return f1 * (f1 + 2 * f2);
        case 1:
            return (2 * f1 + f2) * (2 * f1 - f2) + 2;
        default:  // case 3
            return (2 * f1 + f2) * (2 * f1 - f2) - 2;
    }
}


unittest {
    // fibonacci
    assert(fibonacci(0) == 0);
    assert(fibonacci(1) == 1);
    assert(fibonacci(2) == 1);
    assert(fibonacci(5) == 5);
    assert(fibonacci(10) == 55);
    assert(fibonacci(20) == 6765);
    
    // recursive_fibonacci
    assert(recursive_fibonacci(0) == 0);
    assert(recursive_fibonacci(1) == 1);
    assert(recursive_fibonacci(2) == 1);
    assert(recursive_fibonacci(5) == 5);
    assert(recursive_fibonacci(10) == 55);
    
    // classical_fibonacci
    assert(classical_fibonacci(0) == 0);
    assert(classical_fibonacci(1) == 1);
    assert(classical_fibonacci(2) == 1);
    assert(classical_fibonacci(5) == 5);
    assert(classical_fibonacci(10) == 55);
    assert(classical_fibonacci(20) == 6765);
    
    // BigInt versions
    assert(fibonacci_bigint(0) == BigInt(0));
    assert(fibonacci_bigint(10) == BigInt(55));
    assert(fibonacci_bigint(100) == BigInt("354224848179261915075"));
    
    assert(classical_fibonacci_bigint(0) == BigInt(0));
    assert(classical_fibonacci_bigint(10) == BigInt(55));
    assert(classical_fibonacci_bigint(100) == BigInt("354224848179261915075"));
}

void main() {
    writeln("Fibonacci sequences (ulong):");
    writeln("\niterative fibonacci:");
    foreach (i; 0 .. 15) {
        writeln("  F(", i, ") = ", fibonacci(i));
    }
    
    writeln("\nrecursive fibonacci:");
    foreach (i; 0 .. 15) {
        writeln("  F(", i, ") = ", recursive_fibonacci(i));
    }
    
    writeln("\nclassical (fast) fibonacci:");
    foreach (i; 0 .. 15) {
        writeln("  F(", i, ") = ", classical_fibonacci(i));
    }
    
    writeln("\n\nBigInt fibonacci (handles huge numbers):");
    writeln("  F(100) = ", fibonacci_bigint(100));
    writeln("  F(200) = ", fibonacci_bigint(200));
    writeln("  F(500) = ", fibonacci_bigint(500));
    
    writeln("\nBigInt classical (fast) fibonacci:");
    writeln("  F(100) = ", classical_fibonacci_bigint(100));
    writeln("  F(200) = ", classical_fibonacci_bigint(200));
    writeln("  F(500) = ", classical_fibonacci_bigint(500));
}
