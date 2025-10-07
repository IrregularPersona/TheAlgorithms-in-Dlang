import std.stdio;
import std.traits;
import std.algorithm;

T[] bubble_sort(T)(T[] arr) {
    foreach(i; 0 .. arr.length) {
        foreach(j; 0 .. arr.length - i - 1) {
            if (arr[j] > arr[j + 1]) {
                T temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }

    return arr;
}

unittest {
    int[] arr1 = [64, 34, 25, 12, 22, 11, 90];
    int[] expected1 = [11, 12, 22, 25, 34, 64, 90];
    assert(bubble_sort(arr1) == expected1);

    // already sorted array
    int[] arr2 = [1, 2, 3, 4, 5];
    int[] expected2 = [1, 2, 3, 4, 5];
    assert(bubble_sort(arr2) == expected2);

    // reverse sorted array
    int[] arr3 = [5, 4, 3, 2, 1];
    int[] expected3 = [1, 2, 3, 4, 5];
    assert(bubble_sort(arr3) == expected3);

    // duplicates
    int[] arr4 = [3, 1, 4, 1, 5, 9, 2, 6, 5];
    int[] expected4 = [1, 1, 2, 3, 4, 5, 5, 6, 9];
    assert(bubble_sort(arr4) == expected4);

    // empty array
    int[] arr5 = [];
    int[] expected5 = [];
    assert(bubble_sort(arr5) == expected5);

    // single element
    int[] arr6 = [42];
    int[] expected6 = [42];
    assert(bubble_sort(arr6) == expected6);

    // negative numbers
    int[] arr7 = [-5, 3, -1, 0, 8, -3];
    int[] expected7 = [-5, -3, -1, 0, 3, 8];
    assert(bubble_sort(arr7) == expected7);

    // floats
    double[] arr8 = [3.14, 2.71, 1.41, 1.73];
    double[] expected8 = [1.41, 1.73, 2.71, 3.14];
    assert(bubble_sort(arr8) == expected8);

    writeln("all tests passed.");
}

void main() {
    int[] arr = [5, 2, 9, 1, 5, 6];
    writeln("Original array: ", arr);
    auto sorted = bubble_sort(arr);
    writeln("Sorted array: ", sorted);
}
