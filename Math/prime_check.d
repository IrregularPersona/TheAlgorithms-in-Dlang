import std.stdio;
import std.math : sqrt;
import std.range : iota;

bool primeCheck(ulong num) {
    if (num > 1 && num < 4) return true;
    if (num < 2 || num % 2 == 0) return false;

    auto stop = cast(ulong)sqrt(cast(real)num);
    foreach(i; iota(3, stop + 1, 2)) {
        if (num % i == 0) {
            return false;
        }
    }
    return true;
}

unittest
{
    {
        assert(primeCheck(3) == true);
        assert(primeCheck(7) == true);
        assert(primeCheck(11) == true);
        assert(primeCheck(2003) == true);

        assert(primeCheck(4) == false);
        assert(primeCheck(6) == false);
        assert(primeCheck(21) == false);
        assert(primeCheck(2004) == false);
    }
}

void main() {
    writeln("Hello");
}
