import std.stdio;
import std.exception : enforce;
import std.range : retro;

ulong binaryToDecimal(string binary) {
    enforce(binary.length <= 64, "Binary length can't be more than 64 characters");

    ulong num = 0;
    ulong idxVal = 1;

    // iterate in reverse order
    foreach(bit; binary.retro) {
        if (bit == '1') {
            num += idxVal;
        } else if (bit == '0') {
            // do nothing
        } else {
            enforce(false, "Invalid character in binary string: must be '0' or '1'");
        }
        idxVal <<= 1;  
    }
    
    return num;
}

unittest {
    assert(binaryToDecimal("0") == 0);
    assert(binaryToDecimal("1") == 1);
    assert(binaryToDecimal("10") == 2);
    assert(binaryToDecimal("11") == 3);
    assert(binaryToDecimal("100") == 4);
    assert(binaryToDecimal("101") == 5);
    assert(binaryToDecimal("110") == 6);
    assert(binaryToDecimal("111") == 7);
    assert(binaryToDecimal("1000") == 8);
    assert(binaryToDecimal("1111") == 15);
    assert(binaryToDecimal("10000") == 16);
    assert(binaryToDecimal("11111111") == 255);
    assert(binaryToDecimal("100000000") == 256);
    assert(binaryToDecimal("1111111111") == 1023);
}

void main() {
    string[] testBinary = [
        "0", "1", "10", "11", "100", "101", "110", "111",
        "1000", "1111", "10000", "11111111", "100000000", "1010101010"
    ];
    
    foreach(binary; testBinary) {
        ulong decimal = binaryToDecimal(binary);
        writeln("Binary: ", binary, " → Decimal: ", decimal);
    }
    
    writeln();
    writeln("Try converting 101010:");
    writeln("Binary: 101010 → Decimal: ", binaryToDecimal("101010"));
}
