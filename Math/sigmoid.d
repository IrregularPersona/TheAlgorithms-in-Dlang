import std.stdio;
import std.math : E, pow, isClose;
import std.conv : to;

float[] sigmoid(ref float[] array) {
    foreach(ref value; array) {
        value = 1 / (1 + pow(E, -1 * value)); // e^(-1 * value)
    }
    return array;
}

unittest
{
    {
        float[] test = [1.0, 0.5, -1.0, 0.0, 0.3];
        float[] expected = [0.7310586, 0.62245935, 0.26894143, 0.5, 0.5744425];
        float[] res = sigmoid(test);
        foreach(i; 0 .. res.length) {
            assert(isClose(res[i], expected[i]),
                    "Element: " ~ i.to!string ~ " Mismatched");
        }
    }
}

void main() {
    writeln("Hello");
}
