import std.stdio;
import std.exception : enforce;

uint findHighestSetBit(uint num) {
    enforce(num > 0, "Number cannot be negative.");

    auto pos = 0;
    auto n = num;

    while (n > 0) {
        n >>= 1;
        pos += 1;
    }

    return pos;
}

unittest {
    assert(findHighestSetBit(1) == 1);    // binary: 1
    assert(findHighestSetBit(2) == 2);    // binary: 10
    assert(findHighestSetBit(3) == 2);    // binary: 11
    assert(findHighestSetBit(4) == 3);    // binary: 100
    assert(findHighestSetBit(7) == 3);    // binary: 111
    assert(findHighestSetBit(8) == 4);    // binary: 1000
    assert(findHighestSetBit(15) == 4);   // binary: 1111
    assert(findHighestSetBit(16) == 5);   // binary: 10000
    assert(findHighestSetBit(255) == 8);  // binary: 11111111
    assert(findHighestSetBit(256) == 9);  // binary: 100000000
}

void main() {
    writeln("Finding highest set bit position:");
    writeln();
    
    uint[] testNumbers = [1, 2, 3, 4, 7, 8, 15, 16, 31, 32, 63, 64, 127, 128, 255, 256, 1023, 1024];
    
    foreach(num; testNumbers) {
        uint pos = findHighestSetBit(num);
        writeln("Number: ", num, " (binary: ", toBinaryString(num), ") → Highest bit position: ", pos);
    }
}

// Helper function to display binary representation
string toBinaryString(uint num) {
    if (num == 0) return "0";
    
    string result = "";
    uint n = num;
    
    while (n > 0) {
        result = (n & 1 ? "1" : "0") ~ result;
        n >>= 1;
    }
    
    return result;
}
