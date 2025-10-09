import std.stdio;
import std.range : iota, enumerate;
import std.typecons : Tuple, tuple;
import std.algorithm;

Tuple!(uint, uint)[] amicablePairsUnderN(uint n) {
    uint[] factorSums = new uint[n]; // dynamic array of size n
    foreach(i; 1 .. n) {
        foreach(j; iota(i * 2, n, i)) {
            factorSums[j] += i;
        }
    }

    Tuple!(uint, uint)[] outArr = [tuple(0u, 0u)];

    foreach (i, x; factorSums.enumerate) {
        if (x < n && factorSums[cast(size_t)x] == cast(uint)i && x > cast(uint)i) {
            outArr ~= tuple(cast(uint)i, x);
        }
    }


    if (outArr.length == 1) {
        return [];
    } else {
        return outArr[1 .. $];
    }
}

unittest
{
    // First 10 amicable numbers, sorted (low, high)
    auto expectedResult = [
        tuple(220u, 284u),
        tuple(1_184u, 1_210u),
        tuple(2_620u, 2_924u),
        tuple(5_020u, 5_564u),
        tuple(6_232u, 6_368u),
        tuple(10_744u, 10_856u),
        tuple(12_285u, 14_595u),
        tuple(17_296u, 18_416u),
        tuple(63_020u, 76_084u),
        tuple(66_928u, 66_992u),
    ];

    // Generate pairs under 100,000
    auto result = amicablePairsUnderN(100_000);

    // There should be 13 pairs under 100,000
    assert(result.length == 13, "Expected 13 amicable pairs under 100,000");

    // Check the first 10 against known values
    assert(result[0..10] == expectedResult, "First 10 pairs should match expected values");

    // N that does not have any amicable pairs below it, the result should be empty array
    assert(amicablePairsUnderN(100) == [], "No amicable pairs under 100");
}

void main() {
    writeln("Hello");
}
