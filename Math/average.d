import std.stdio;
import std.algorithm : fold, sort;
import std.traits;

T sum(T)(T[] sequence) if (isNumeric!T) {
    if (sequence.length == 0) return T(0);
    return sequence
        .fold!((acc, x) => acc + x)(T(0));
}

T mean(T)(T[] sequence) if (isNumeric!T) {
    if (sequence.length == 0) return T(0);
    
    static if (isFloatingPoint!T) {
        return sum(sequence) / sequence.length;
    } else {
        return cast(T)(cast(double)sum(sequence) / sequence.length);
    }
}

T mean_of_two(T)(T a, T b) if (isNumeric!T) {
    return (a + b) / T(2);  
}

T median(T)(T[] sequence) if (isNumeric!T) {
    if (sequence.length == 0) return T(0);

    T[] seqDup = sequence.dup;
    seqDup.sort(); // not using a helper.. just easier

    if (seqDup.length % 2 == 1) {
        ulong k = (seqDup.length + 1) / 2;
        return seqDup[k - 1];
    } else {
        ulong j = (seqDup.length) / 2;
        return mean_of_two(seqDup[j - 1], seqDup[j]);
    }
}

unittest {
    assert(sum([1, 2, 3, 4, 5]) == 15);
    assert(sum([1.1, 2.2, 3.3]) == 6.6);
    assert(sum(cast(int[])[]) == 0);
    
    assert(mean([2, 4, 6]) == 4);
    assert(mean([1.0, 2.0, 3.0]) == 2.0);
    assert(mean([1, 2]) == 1);  
    
    assert(mean_of_two(10, 20) == 15);
    assert(mean_of_two(1.5, 2.5) == 2.0);
    
    assert(median([1, 2, 3, 4, 5]) == 3);           
    assert(median([1, 2, 3, 4]) == 2);              
    assert(median([5, 1, 3, 2, 4]) == 3);           
    assert(median([1.0, 2.0, 3.0, 4.0]) == 2.5);    
    
    int[] original = [3, 1, 4, 1, 5];
    int[] backup = original.dup;
    auto med = median(original);
    assert(original == backup);  
    
    writeln("all tests passed");
}

void main() {
    int[] intData = [5, 2, 8, 1, 9, 3, 7];
    double[] floatData = [5.5, 2.1, 8.7, 1.2, 9.3, 3.8, 7.4];
    
    writeln("int data: ", intData);
    writeln("  Sum: ", sum(intData));
    writeln("  Mean: ", mean(intData));
    writeln("  Median: ", median(intData));
    
    writeln("\nfloat data: ", floatData);
    writeln("  Sum: ", sum(floatData));
    writeln("  Mean: ", mean(floatData));
    writeln("  Median: ", median(floatData));

    // edge cases
    writeln("\nedge cases:");
    writeln("  Empty array sum: ", sum(cast(int[])[]));
    writeln("  Empty array mean: ", mean(cast(int[])[]));
    writeln("  Empty array median: ", median(cast(int[])[]));
}
