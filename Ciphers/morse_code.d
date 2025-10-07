import std.stdio;
import std.array;
import std.conv : to;
import std.string : toUpper;
import std.algorithm : map, splitter;

immutable(string[dchar]) getMorseDict() { // has to be dchar since strings in D are treated as Unicode.... (why....)
    return [
        'A': ".-", 'B': "-...", 'C': "-.-.", 'D': "-..",
        'E': ".", 'F': "..-.", 'G': "--.", 'H': "....",
        'I': "..", 'J': ".---", 'K': "-.-", 'L': ".-..",
        'M': "--", 'N': "-.", 'O': "---", 'P': ".--.",
        'Q': "--.-", 'R': ".-.", 'S': "...", 'T': "-",
        'U': "..-", 'V': "...-", 'W': ".--", 'X': "-..-",
        'Y': "-.--", 'Z': "--..", '1': ".----", '2': "..---",
        '3': "...--", '4': "....-", '5': ".....", '6': "-....",
        '7': "--...", '8': "---..", '9': "----.", '0': "-----",
        '&': ".-...", '@': ".--.-.", ':': "---...", ',': "--..--",
        '.': ".-.-.-", '\'': ".----.", '"': ".-..-.", '?': "..--..",
        '/': "-..-.", '=': "-...-", '+': ".-.-.", '-': "-....-",
        '(': "-.--.", ')': "-.--.-", ' ': "/", '!': "-.-.--"
    ];
}

immutable(dchar[string]) getRevMorseDict() { // simple switcheroo with the maps
    dchar[string] rev;
    foreach(char_key, morse_val; getMorseDict()) {
        rev[morse_val] = char_key;
    }
    return cast(immutable) rev;
}

string encode(string message) {
    auto dict = getMorseDict();  
    return message
        .toUpper
        .map!(c => dict.get(c, "?"))
        .join(" ");
}

string decode(string message) {
    auto dict = getRevMorseDict();
        return message
        .splitter(" ") // the splitting character. interesting naming ngl
        .map!(code => dict.get(code, '?'))
        .to!string;
}

unittest {
    // basic letter encoding
    assert(encode("A") == ".-");
    assert(encode("B") == "-...");
    assert(encode("S") == "...");
    assert(encode("O") == "---");
    
    // case insensitivity
    assert(encode("a") == ".-");
    assert(encode("b") == "-...");
    assert(encode("SOS") == encode("sos"));
    assert(encode("Hello") == encode("HELLO"));
    
    // basic decoding
    assert(decode(".-") == "A");
    assert(decode("-...") == "B");
    assert(decode("...") == "S");
    assert(decode("---") == "O");
    
    // word encoding
    assert(encode("SOS") == "... --- ...");
    assert(encode("HELLO") == ".... . .-.. .-.. ---");
    assert(encode("WORLD") == ".-- --- .-. .-.. -..");
    
    // word decoding
    assert(decode("... --- ...") == "SOS");
    assert(decode(".... . .-.. .-.. ---") == "HELLO");
    assert(decode(".-- --- .-. .-.. -..") == "WORLD");
    
    // numbers
    assert(encode("123") == ".---- ..--- ...--");
    assert(encode("0") == "-----");
    assert(decode(".---- ..--- ...--") == "123");
    assert(decode("-----") == "0");
    
    // special chars
    assert(encode("!") == "-.-.--");
    assert(encode("?") == "..--..");
    assert(encode(".") == ".-.-.-");
    assert(encode(",") == "--..--");
    
    // spaces 
    assert(encode("A B") == ".- / -...");
    assert(encode("HI THERE") == ".... .. / - .... . .-. .");
    assert(decode(".- / -...") == "A B");
    
    // unknown characters 
    assert(encode("#") == "?");
    assert(encode("$") == "?");
    assert(encode("A#B") == ".- ? -...");
    assert(decode("?") == "?");
    
    // empty string
    assert(encode("") == "");
    assert(decode("") == "");
    
    // round-trip 
    string[] testMessages = [
        "HELLO",
        "SOS", 
        "THE QUICK BROWN FOX",
        "123 ABC !?.",
        "MORSE CODE IS FUN"
    ];
    
    foreach (msg; testMessages) {
        string encoded = encode(msg);
        string decoded = decode(encoded);
        assert(decoded == msg, 
            "round-trip failed for: " ~ msg ~ " -> " ~ encoded ~ " -> " ~ decoded);
    }
    
    // mixed case round-trip (should normalize to uppercase)
    assert(decode(encode("Hello World")) == "HELLO WORLD");
    assert(decode(encode("MoRsE cOdE")) == "MORSE CODE");
    
    // complete alphabet
    assert(encode("ABCDEFGHIJKLMNOPQRSTUVWXYZ") == 
           ".- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --..");
    
    // complete numbers
    assert(encode("1234567890") == 
           ".---- ..--- ...-- ....- ..... -.... --... ---.. ----. -----");
    
    // special message
    assert(encode("HELLO, WORLD!") == ".... . .-.. .-.. --- --..-- / .-- --- .-. .-.. -.. -.-.--");
    
    // unknown morse codes decode to '?'
    assert(decode(".-.-.-.-") == "?");  // invalid morse code
    assert(decode("... --- ... .-.-.-.-") == "SOS?");  // mix of valid and invalid
    
    writeln("all tests passed");
}

void main() {
    string message = "SOS";
    string encoded = encode(message);
    string decoded = decode(encoded);
    
    writefln("Original: %s", message);
    writefln("Encoded:  %s", encoded);
    writefln("Decoded:  %s", decoded);
}
