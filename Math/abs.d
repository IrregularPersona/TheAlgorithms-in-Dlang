import std.stdio;
import std.traits;

T abs(T)(T num) if (isNumeric!T) {
    if (num < 0) {
        return -num;
    }
    return num;
}

unittest {
    assert(abs(1) == 1);
    assert(abs(-1) == 1);
    assert(abs(0) == 0);          
    assert(abs(-42) == 42);       
    assert(abs(3.14) == 3.14);    
    assert(abs(-2.5) == 2.5);     
}

void main() {
    // demo
    writeln("abs(-5) = ", abs(-5));
    writeln("abs(5) = ", abs(5));
    writeln("abs(-3.14) = ", abs(-3.14));
    writeln("abs(0) = ", abs(0));
}
