import std.stdio;

uint squarePyramidalNumbers(uint n) {
    return n * (n + 1) * (2 * n + 1) / 6;
}

unittest
{
    {
        assert(squarePyramidalNumbers(0) == 0);
        assert(squarePyramidalNumbers(1) == 1);
        assert(squarePyramidalNumbers(2) == 5);
        assert(squarePyramidalNumbers(3) == 14);
    }
}

void main() {
    writeln("Hello");
}
