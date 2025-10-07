import std.stdio;
import std.range : iota, enumerate;
import std.typecons : Tuple, tuple;
import std.algorithm;

Tuple!(uint, uint)[] amicablePairsUnderN(uint n) {
    uint factorSums[n]; // factor sums of size n
    foreach(i; 1 .. n) {
        foreach(j; iota(i * 2, n, i)) {
            factorSums[j] += i;
        }
    }

    auto out = [tuple(0, 0)];

    foreach (i, x; factorSums.enumerate) {
        if (x < n && factorSums[cast(size_t)x] == cast(uint)i && x > cast(int)i) {
            out ~= tuple(cast(uint)i, x);
        }
    }

    assert(out.length == 1, "Out length has to be of 1.");
    
}

unittest
{
    
}

void main() {
    
}
