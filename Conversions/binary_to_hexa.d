import std.stdio;
import std.string : rightJustify;
import std.exception : enforce;

const string[ubyte] BITS_TO_HEX = [
  0b0000: "0",
  0b0001: "1",
  0b0010: "2",
  0b0011: "3",
  0b0100: "4",
  0b0101: "5",
  0b0110: "6",
  0b0111: "7",
  0b1000: "8",
  0b1001: "9",
  0b1010: "A",
  0b1011: "B",
  0b1100: "C",
  0b1101: "D",
  0b1110: "E",
  0b1111: "F",
];

string binaryToHex(string binary) {
    enforce(binary.length > 0, "Binary string cannot be empty");
    
    // pad
    string paddedBinary = binary.rightJustify((binary.length + 3) / 4 * 4, '0');
    
    string hexResult = "";
    
    // 4 bits at a time
    for (size_t i = 0; i < paddedBinary.length; i += 4) {
        string fourBits = paddedBinary[i .. i + 4];
        ubyte value = 0;
        
        foreach (bit; fourBits) {
            enforce(bit == '0' || bit == '1', "Invalid character in binary string");
            value = cast(ubyte)((value << 1) | (bit - '0'));
        }
        
        hexResult ~= BITS_TO_HEX[value];
    }
    
    return hexResult;
}

unittest {
    assert(binaryToHex("0") == "0");
    assert(binaryToHex("1") == "1");
    assert(binaryToHex("1111") == "F");
    assert(binaryToHex("10000") == "10");
    assert(binaryToHex("11111111") == "FF");
    assert(binaryToHex("1010") == "A");
    assert(binaryToHex("1011") == "B");
    assert(binaryToHex("1100") == "C");
    assert(binaryToHex("1101") == "D");
    assert(binaryToHex("1110") == "E");
    assert(binaryToHex("101010") == "2A");
    assert(binaryToHex("11111110") == "FE");
    assert(binaryToHex("100000000") == "100");
}

void main() {
    string[] testBinary = [
        "0", "1", "1111", "10000", "11111111", 
        "1010", "1011", "1100", "1101", "1110",
        "101010", "11111110", "100000000"
    ];
    
    foreach(binary; testBinary) {
        string hex = binaryToHex(binary);
        writeln("Binary: ", binary.rightJustify(12), " → Hex: ", hex);
    }
}
