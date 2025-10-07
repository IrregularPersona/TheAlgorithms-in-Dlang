import std.stdio;
import std.range : iota;
import std.array : array, insertInPlace;
import std.algorithm : map, countUntil, remove;

char[] blankCharTable() {
    return iota(0, 256).map!(ch => cast(char)ch).array;  
}

ubyte[] moveToFrontEncode(string text) {
    char[] charTable = blankCharTable(); 
    ubyte[] result;

    foreach(dchar ch; text) {
        auto pos = countUntil(charTable, ch);
        if (pos >= 0) {
            result ~= cast(ubyte)pos;
            charTable = charTable.remove(pos);
            insertInPlace(charTable, 0, cast(char)ch);
        }
    }
    
    return result;
}

unittest {
    auto encoded = moveToFrontEncode("hello");
    writeln(encoded);
    
    auto encoded2 = moveToFrontEncode("bananaaa");
    writeln(encoded2);
}

void main() {
    string test = "hello";
    auto result = moveToFrontEncode(test);
    writeln("Input: '", test, "' → ", result);
    
    string test2 = "bananaaa";
    auto result2 = moveToFrontEncode(test2);
    writeln("Input: '", test2, "' → ", result2);
}
