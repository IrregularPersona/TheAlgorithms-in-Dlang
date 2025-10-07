import std.stdio;
import std.conv : to;
import std.uni : toUpper;
import std.array : array;
import std.algorithm : map;
import std.ascii : isAlpha, isUpper, isLower;

dchar rot13(dchar c) {  
    if (!c.isAlpha) return c;

    dchar base = c.isUpper ? 'A' : 'a';
    return cast(dchar)((c - base + 13) % 26 + base);  
}

string rot13(string text) {
    return text.map!rot13.array.to!string;
}

unittest {
    // basic lowercase 
    assert(rot13('a') == 'n');
    assert(rot13('b') == 'o');
    assert(rot13('m') == 'z');
    assert(rot13('n') == 'a');
    assert(rot13('z') == 'm');
    
    // basic uppercase 
    assert(rot13('A') == 'N');
    assert(rot13('B') == 'O');
    assert(rot13('M') == 'Z');
    assert(rot13('N') == 'A');
    assert(rot13('Z') == 'M');
    
    // non-alphabetic characters 
    assert(rot13('0') == '0');
    assert(rot13('9') == '9');
    assert(rot13(' ') == ' ');
    assert(rot13('!') == '!');
    assert(rot13('@') == '@');
    assert(rot13('#') == '#');
    
    // string transformations
    assert(rot13("Hello") == "Uryyb");
    assert(rot13("World") == "Jbeyq");
    assert(rot13("ABC") == "NOP");
    assert(rot13("xyz") == "klm");
    
    // mixed case and special characters
    assert(rot13("Hello, World!") == "Uryyb, Jbeyq!");
    assert(rot13("Test123") == "Grfg123");
    assert(rot13("ROT13") == "EBG13");
    
    // empty string
    assert(rot13("") == "");
    
    // rot26 test
    assert(rot13(rot13("Hello")) == "Hello");
    assert(rot13(rot13("World!")) == "World!");
    assert(rot13(rot13("ABC123xyz")) == "ABC123xyz");
    
    // full alphabet test
    assert(rot13("abcdefghijklmnopqrstuvwxyz") == "nopqrstuvwxyzabcdefghijklm");
    assert(rot13("ABCDEFGHIJKLMNOPQRSTUVWXYZ") == "NOPQRSTUVWXYZABCDEFGHIJKLM");
    
    // simple brown fox test
    assert(rot13("The quick brown fox jumps over the lazy dog") == 
           "Gur dhvpx oebja sbk whzcf bire gur ynml qbt");
    
    // non-English characters test
    assert(rot13("{}[]()") == "{}[]()");
    
    // boundary cases
    assert(rot13("aZ") == "nM");
    assert(rot13("Mn") == "Za");
    
    writeln("All tests passed");
}

void main() {
    // examples
    string[] examples = [
        "Hello World!",
        "This is a secret message",
        "ROT13 is fun!",
        "abcdefghijklmnopqrstuvwxyz",
        "NOPQRSTUVWXYZABCDEFGHIJKLM"
    ];
    
    foreach (example; examples) {
        string encoded = rot13(example);
        string decoded = rot13(encoded);
        
        writefln("Original: %s", example);
        writefln("ROT13:    %s", encoded);  
        writefln("Back:     %s", decoded);
        writefln("Match:    %s", decoded == example ? "Yes" : "No");
        writeln();
    }
}
