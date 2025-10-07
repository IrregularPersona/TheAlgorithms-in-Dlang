import std.stdio;

uint count_set_bits(uint n) {
    auto count = 0;
    while (n > 0) {
        n &= n - 1;
        count++;
    }

    return count;
}

unittest {
    assert(count_set_bits(0) == 0);
    assert(count_set_bits(1) == 1);
    assert(count_set_bits(0b1010101) == 4);
    assert(count_set_bits(0b001101) == 3);
}

void main() {
    writeln("The number 57 has ", count_set_bits(57), " bits set.");
}

