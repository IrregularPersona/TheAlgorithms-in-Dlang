import std.stdio;
import std.math : E, pow, isClose;
import std.conv : to;

float[] tanh(ref float[] array) {
    foreach(ref elem; array) {
        elem = (2 / (1 + pow(E, -2 * elem))) -1;
    }
    return array;
}

unittest
{
    {
        float[] test = [1.0, 0.5, -1.0, 0.0, 0.3];
        float[] expected = [0.76159406, 0.4621172, -0.7615941, 0.0, 0.29131258];
        float[] res = tanh(test);
        foreach(i; 0 .. res.length) {
            assert(isClose(res[i], expected[i]),
                    "Element: " ~ i.to!string ~ " Mismatched");
        }
    }
}

void main() {
    writeln("Hello");
}

