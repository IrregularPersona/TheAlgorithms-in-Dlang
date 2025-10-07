import std.stdio;

// double loop
int[2] twoSum(int[] arr, int target) {
    int[2] res;

    // -1 indicates not found
    res[0] = -1;
    res[1] = -1;
    
    foreach(i; 0 .. arr.length) {
        foreach(j; i + 1 .. arr.length) {
            if (arr[i] + arr[j] == target) {
                res[0] = cast(int)i;
                res[1] = cast(int)j;
                return res;
            }
        }
    }

    return res;
}

// hash map
int[2] twoSumHashMap(int[] arr, int target) {
    int[2] res;
    res[0] = -1;
    res[1] = -1;
    
    int[int] seen;
    
    foreach(i, val; arr) {
        int complement = target - val;
        
        if (complement in seen) {
            res[0] = seen[complement];
            res[1] = cast(int)i;
            return res;
        }
        
        seen[val] = cast(int)i;
    }
    
    return res;
}

unittest {
    int[] arr1 = [2, 7, 11, 15];
    auto result1 = twoSum(arr1, 9);
    assert(result1[0] == 0 && result1[1] == 1); // 2 + 7 = 9
    
    int[] arr2 = [3, 2, 4];
    auto result2 = twoSum(arr2, 6);
    assert(result2[0] == 1 && result2[1] == 2); // 2 + 4 = 6
    
    int[] arr3 = [1, 2, 3];
    auto result3 = twoSum(arr3, 10);
    assert(result3[0] == -1 && result3[1] == -1);
    
    int[] arr4 = [3, 3];
    auto result4 = twoSum(arr4, 6);
    assert(result4[0] == 0 && result4[1] == 1); // 3 + 3 = 6
    
    auto result5 = twoSumHashMap(arr1, 9);
    assert(result5[0] == 0 && result5[1] == 1);
    
    auto result6 = twoSumHashMap(arr2, 6);
    assert(result6[0] == 1 && result6[1] == 2);
    
    auto result7 = twoSumHashMap(arr3, 10);
    assert(result7[0] == -1 && result7[1] == -1);
    
    auto result8 = twoSumHashMap(arr4, 6);
    assert(result8[0] == 0 && result8[1] == 1);
}

void main() {
    int[] arr = [2, 7, 11, 15];
    int target = 9;
    
    writeln("Array: ", arr);
    writeln("Target: ", target);
    writeln();
    
    writeln("Hash Map Approach:");
    auto result2 = twoSumHashMap(arr, target);
    if (result2[0] != -1) {
        writeln("Found at indices [", result2[0], ", ", result2[1], "]");
        writeln("Values: ", arr[result2[0]], " + ", arr[result2[1]], " = ", arr[result2[0]] + arr[result2[1]]);
    } else {
        writeln("No solution found");
    }
}
