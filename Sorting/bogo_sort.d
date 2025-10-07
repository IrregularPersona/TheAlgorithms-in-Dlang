import std.stdio;
import std.algorithm : isSorted;
import std.random : randomShuffle;

T[] bogo_sort(T)(T[] arr) {
    if (arr.length <= 1) {
        return arr;
    }
    
    while (!isSorted(arr)) {
        randomShuffle(arr); // yes this is a built in function in Dlang lol
    }
    
    return arr;
}

unittest {
    // empty array
    int[] arr1 = [];
    int[] expected1 = [];
    assert(bogo_sort(arr1) == expected1);

    // single element
    int[] arr2 = [42];
    int[] expected2 = [42];
    assert(bogo_sort(arr2) == expected2);

    // already sorted (small)
    int[] arr3 = [1, 2, 3];
    int[] expected3 = [1, 2, 3];
    assert(bogo_sort(arr3) == expected3);

    // small unsorted array
    int[] arr4 = [3, 1, 2];
    int[] expected4 = [1, 2, 3];
    assert(bogo_sort(arr4) == expected4);

    // duplicates
    int[] arr5 = [2, 1, 2];
    int[] expected5 = [1, 2, 2];
    assert(bogo_sort(arr5) == expected5);

    // negative numbers
    int[] arr6 = [0, -1, 1];
    int[] expected6 = [-1, 0, 1];
    assert(bogo_sort(arr6) == expected6);

    writeln("all tests passed.");
}

void main() {
    int[] arr = [3, 1, 2];
    writeln("Original array: ", arr);
    auto sorted = bogo_sort(arr);
    writeln("Sorted array: ", sorted);
}
