import std.stdio;

import std.algorithm : map;
import std.array : array;
import std.range : enumerate;

ubyte[] xor_bytes(ubyte[] text, ubyte key) {
    return text.map!(ch => cast(ubyte)(ch ^ key)).array;  
}

ubyte[] xor(string text, ubyte key) {
    return xor_bytes(cast(ubyte[])text, key);
}



unittest {
    {
        string test_string = "test string";
        auto ciphered_text = xor(test_string, 32);
        assert(cast(ubyte[])test_string == xor_bytes(ciphered_text, 32));
        writeln("simple passed");
    }
    
    {
        string test_string = "The quick brown fox jumps over the lazy dog";
        auto ciphered_text = xor(test_string, 64);
        assert(cast(ubyte[])test_string == xor_bytes(ciphered_text, 64));
        writeln("with space passed");
    }
    
    {
        string test_string = "日本語";
        ubyte key = 42;
        auto ciphered_text = xor(test_string, key);
        assert(cast(ubyte[])test_string == xor_bytes(ciphered_text, key));
        writeln("UTF-8 test passed");
    }

    {
        string test_string = "The quick brown fox jumps over the lazy dog";
        ubyte key = cast(ubyte)' ';  
        auto ciphered_text = xor(test_string, key);
        assert(cast(ubyte[])test_string == xor_bytes(ciphered_text, key));
        writeln("space char key test passed");
    }
    
    {
        string test_string = "The quick brown fox jumps over the lazy dog";
        ubyte key = cast(ubyte)~0;  
        auto ciphered_text = xor(test_string, key);
        assert(cast(ubyte[])test_string == xor_bytes(ciphered_text, key));
        writeln("max byte value (255) test passed");
    }
    
    writeln("all tests passed");
}


void main() {
    ubyte[] test = [72, 101, 108, 108, 111]; // "Hello"
    ubyte key = 42;
    
    auto encrypted = xor_bytes(test, key);
    auto decrypted = xor_bytes(encrypted, key);
    
    writeln("Original:  ", test);
    writeln("Encrypted: ", encrypted);
    writeln("Decrypted: ", decrypted);
    writeln("As string: ", cast(string)decrypted);
}

