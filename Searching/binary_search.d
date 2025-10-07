import std.stdio;
import std.algorithm : sort;
import std.traits : isNumeric;

bool binarySearch(T)(T[] arr, T target) if (isNumeric!T) {
    if (arr.length == 0) return false;

    T[] temp = arr.dup;
    temp.sort();

    int left = 0;
    int right = cast(int)temp.length - 1;

    while (left <= right) {
        int mid = left + (right - left) / 2;

        if (temp[mid] == target) {
            return true;
        } else if (temp[mid] > target) {
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }

    return false;
}

unittest {
    // integers
    assert(binarySearch([1, 2, 3, 4, 5], 3) == true);
    assert(binarySearch([1, 2, 3, 4, 5], 6) == false);
    assert(binarySearch([1, 2, 3, 4, 5], 1) == true);
    assert(binarySearch([1, 2, 3, 4, 5], 5) == true);
    assert(binarySearch([1, 2, 3, 4, 5], 0) == false);
    
    // unsorted array
    assert(binarySearch([5, 2, 8, 1, 9], 8) == true);
    assert(binarySearch([5, 2, 8, 1, 9], 7) == false);
    
    // empty array
    assert(binarySearch([], 1) == false);
    
    // single element
    assert(binarySearch([42], 42) == true);
    assert(binarySearch([42], 41) == false);
    
    // doubles
    assert(binarySearch([1.5, 2.5, 3.5, 4.5], 3.5) == true);
    assert(binarySearch([1.5, 2.5, 3.5, 4.5], 3.0) == false);
}

void main() {
    int[] arr = [64, 34, 25, 12, 22, 11, 90];
    
    writeln("array: ", arr);
    writeln("searching for 22: ", binarySearch(arr, 22));
    writeln("searching for 50: ", binarySearch(arr, 50));
    writeln("searching for 11: ", binarySearch(arr, 11));
    writeln("searching for 90: ", binarySearch(arr, 90));
}
