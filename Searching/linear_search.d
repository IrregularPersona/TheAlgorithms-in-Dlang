import std.stdio;

bool linear_search(T)(T[] arr, T target) {
    foreach(element; arr) {
        if (element == target) {
            return true;
        }
    }

    return false;
}

unittest {
    // integers
    assert(linear_search([1, 2, 3, 4, 5], 3) == true);
    assert(linear_search([1, 2, 3, 4, 5], 6) == false);
    assert(linear_search([1, 2, 3, 4, 5], 1) == true);
    assert(linear_search([1, 2, 3, 4, 5], 5) == true);
    
    // empty array
    assert(linear_search([], 1) == false);
    
    // single element
    assert(linear_search([42], 42) == true);
    assert(linear_search([42], 41) == false);
    
    // strings
    assert(linear_search(["hello", "world", "foo"], "world") == true);
    assert(linear_search(["hello", "world", "foo"], "bar") == false);
}

void main() {
    int[] arr = [64, 34, 25, 12, 22, 11, 90];
    
    writeln("array: ", arr);
    writeln("searching for 22: ", linear_search(arr, 22));
    writeln("searching for 50: ", linear_search(arr, 50));
    writeln("searching for 11: ", linear_search(arr, 11));
    writeln("searching for 90: ", linear_search(arr, 90));
}
