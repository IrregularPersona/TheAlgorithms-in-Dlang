import std.stdio; // import this for basic I/O operation
import std.algorithm;

class Solution {
    public string[] res;
    
    void makeStrings(string str, int n, int closed, int open) {
        if (str.length == 2 * n) {
            res ~= str;
            return;
        }
        
        if (open < n) {
            makeStrings(str ~ '(', n, closed, open + 1);
        }
        
        if (closed < open) {
            makeStrings(str ~ ')', n, closed + 1, open);
        }
    }
}

string[] generate(int n) {
    auto solution = new Solution(); 
    solution.makeStrings("", n, 0, 0);  
    return solution.res;
}

unittest {
    // Test case 1: n = 1
    auto result1 = generate(1);
    assert(result1 == ["()"]);
    
    // Test case 2: n = 2  
    auto result2 = generate(2);
    // should contain: ["(())", "()()"]
    assert(result2.length == 2);
    assert(result2.canFind("(())"));
    assert(result2.canFind("()()"));
    
    // Test case 3: n = 3
    auto result3 = generate(3);
    // should contain: ["((()))", "(()())", "(())()", "()(())", "()()()"]
    assert(result3.length == 5);
    
    // Test case 4: n = 0
    auto result4 = generate(0);
    assert(result4 == [""]);

    writeln("All test passed");   
}

void main() {
   writeln("quick sample:");
    foreach (n; 1..4) {
        writeln("n = ", n, ":");
        auto combinations = generate(n);
        foreach (combo; combinations) {
            writeln("  ", combo);
        }
        writeln();
    }
}
