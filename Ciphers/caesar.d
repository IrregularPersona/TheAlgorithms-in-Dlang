import std.stdio;
import std.ascii : isAlpha, isLower, isUpper;
import std.exception : enforce;
import std.algorithm : map;
import std.array : array, join;
import std.conv : to;
// from the rust implementation

const ubyte ALPHABET_LENGTH = cast(ubyte)'z' - cast(ubyte)'a' + 1;
const string ERROR_MESSAGE = "Rotation must be between 0 and 25";

string caesar(string text, int rotation) {
    enforce(rotation >= 0 && rotation < ALPHABET_LENGTH, ERROR_MESSAGE);

    return text
        .map!((c) {
            if (c.isAlpha) {
                return shift_char(c, rotation);
            } else {
                return c;
            }
        })
        .array
        .to!string;
}

char shift_char(dchar c, int rotation) {
    char first = c.isLower ? cast(ubyte)'a' : cast(ubyte)'A';
    return cast(char)(((cast(ubyte)c - first) + rotation) % ALPHABET_LENGTH + first);
}

unittest {
    assert(caesar("abc", 1) == "bcd");
    assert(caesar("xyz", 3) == "abc");  
    assert(caesar("ABC", 1) == "BCD");
    assert(caesar("XYZ", 3) == "ABC");

    assert(caesar("Hello, World!", 13) == "Uryyb, Jbeyq!");

    assert(caesar("Hello", 0) == "Hello");

    writeln("all test passed");
}

void main() {
    try {
        string message = "Hello, World!";
        int rotation = 13;
        
        string encrypted = caesar(message, rotation);
        string decrypted = caesar(encrypted, ALPHABET_LENGTH - rotation);  
        
        writeln("Original:  ", message);
        writeln("Encrypted: ", encrypted);
        writeln("Decrypted: ", decrypted);

        // invalid rotation 
        caesar("test", 26);  
    } catch (Exception e) {
        writeln("Expected error: ", e.msg);
    }
}
