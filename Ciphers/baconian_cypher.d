import std.stdio;
import std.array;
import std.conv : to;
import std.range : chunks, enumerate;
import std.string : indexOf, toUpper;
import std.algorithm : map, joiner, countUntil;

string baconian_encode(string message) {
    string alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    string[] baconian = [
        "AAAAA", "AAAAB", "AAABA", "AAABB", "AABAA", "AABAB", "AABBA", "AABBB",
        "ABAAA", "ABAAB", "ABABA", "ABABB", "ABBAA", "ABBAB", "ABBBA", "ABBBB",
        "BAAAA", "BAAAB", "BAABA", "BAABB", "BABAA", "BABAB", "BABBA", "BABBB",
        "BBAAA", "BBAAB"
    ];

    return message
        .map!((c) {
            auto upperC = c.toUpper;
            auto index = alphabet.indexOf(upperC);
            if (index >= 0) {
                return baconian[index];
            } else {
                return [c].to!string;
            }
        })
        .array
        .join("");
}

string baconian_decode(string encoded) {
    string alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    string[] baconian = [
        "AAAAA", "AAAAB", "AAABA", "AAABB", "AABAA", "AABAB", "AABBA", "AABBB",
        "ABAAA", "ABAAB", "ABABA", "ABABB", "ABBAA", "ABBAB", "ABBBA", "ABBBB",
        "BAAAA", "BAAAB", "BAABA", "BAABB", "BABAA", "BABAB", "BABBA", "BABBB",
        "BBAAA", "BBAAB"
    ];

    return encoded
        .chunks(5)
        .map!((chunk) {
            string chunkStr = chunk.to!string;
            auto index = baconian.countUntil(chunkStr);
            if (index >= 0) {
                return alphabet[index];
            } else {
                return ' ';
            }
        })
        .array
        .to!string;
}

unittest {
    assert(baconian_encode("A") == "AAAAA");
    assert(baconian_encode("B") == "AAAAB");
    assert(baconian_encode("Z") == "BBAAB");
    
    assert(baconian_decode("AAAAA") == "A");
    assert(baconian_decode("AAAAB") == "B");
    assert(baconian_decode("BBAAB") == "Z");
    
    assert(baconian_encode("HELLO") == "AABBBAABAAABABBABABBABBBA");
    assert(baconian_decode("AABBBAABAAABABBABABBABBBA") == "HELLO");
    
    string[] testWords = ["HELLO", "WORLD", "SECRET", "BACONIAN", "CIPHER"];
    
    foreach (word; testWords) {
        string encoded = baconian_encode(word);
        string decoded = baconian_decode(encoded);
        assert(decoded == word, "roundtrip failed for: " ~ word);
        writefln("%s -> %s -> %s", word, encoded, decoded);
    }
    
    assert(baconian_encode("hello") == baconian_encode("HELLO"));
    assert(baconian_decode(baconian_encode("Hello")) == "HELLO");
    
    writeln("all tests passed");
}

void main() {
    string message = "HELLO WORLD";
    string encoded = baconian_encode(message);
    string decoded = baconian_decode(encoded);
    
    writeln("Original: ", message);
    writeln("Encoded:  ", encoded);
    writeln("Decoded:  ", decoded);
    
}
