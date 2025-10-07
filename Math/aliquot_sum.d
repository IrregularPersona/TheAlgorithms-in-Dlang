import std.stdio;
import std.range : iota;
import std.algorithm : filter, sum;
import std.exception : enforce;

ulong aliquot_sum(ulong number) {
    enforce(number > 0, "Number has to be positive.");
    return cast(ulong)iota(1, number / 2 + 1).filter!(d => number % d == 0).sum;
}

unittest {
    assert(aliquot_sum(1) == 0);   
    assert(aliquot_sum(6) == 6);   
    assert(aliquot_sum(12) == 16); 
    assert(aliquot_sum(28) == 28); 
    assert(aliquot_sum(8) == 7);   
    assert(aliquot_sum(20) == 22); 
}

// helper function, not necessary
string classify_number(ulong n, ulong sum) {
    if (sum < n) return "deficient";
    if (sum > n) return "abundant"; 
    return "perfect";
}

void main() {

    ulong[] testNumbers = [1, 6, 12, 28, 20, 100];
    
    foreach (num; testNumbers) {
        ulong sum = aliquot_sum(num);
        string classification = classify_number(num, sum);
        writefln("%d: aliquot sum = %d (%s)", num, sum, classification);
    }
}
