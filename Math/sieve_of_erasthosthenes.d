module Math.sieve_of_erasthosthenes;

import std.stdio;
import std.math : sqrt;
import std.algorithm : filter, map;
import std.range : enumerate;
import std.array : array;

ulong[] sieve_of_erasthosthenes(ulong num) {
    ulong[] result;
    if (num >= 2) {
        bool[] sieve = new bool[num + 1];
        sieve[] = true;  // Initialize all to true
        sieve[0] = false;
        sieve[1] = false;

        ulong end = cast(ulong)sqrt(cast(real)num);

        // Mark non-prime numbers in the sieve and collect primes up to end
        update_sieve(sieve, end, num, result);

        // Collect remaining primes beyond end
        result ~= extract_remaining_primes(sieve, end + 1);
    }
    return result;
}

void update_sieve(bool[] sieve, ulong end, ulong num, ref ulong[] result) {
    foreach(start; 2 .. end + 1) {
        if (sieve[start]) {
            result ~= start;  // Collect prime numbers up to end

            for (ulong i = start * start; i <= num; i += start) {
                sieve[i] = false;
            }
        }
    }
}

ulong[] extract_remaining_primes(bool[] sieve, ulong start) {
    return sieve[start .. $]
        .enumerate
        .filter!(pair => pair.value)
        .map!(pair => start + pair.index)
        .array;
}

unittest {
    // primes up to 10
    assert(sieve_of_erasthosthenes(10) == [2, 3, 5, 7]);
    
    // primes up to 20
    assert(sieve_of_erasthosthenes(20) == [2, 3, 5, 7, 11, 13, 17, 19]);
    
    // primes up to 30
    assert(sieve_of_erasthosthenes(30) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]);
    
    // edge cases
    assert(sieve_of_erasthosthenes(0) == []);
    assert(sieve_of_erasthosthenes(1) == []);
    assert(sieve_of_erasthosthenes(2) == [2]);
}

// Comment out main when using as a module
// void main() {
//     writeln("Primes up to 50: ", sieve_of_erasthosthenes(50));
//     writeln("Primes up to 100: ", sieve_of_erasthosthenes(100));
// }
