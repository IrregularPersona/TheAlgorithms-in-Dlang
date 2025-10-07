import std.stdio;
import std.conv : to;
import std.math : isClose;

float[] relu(ref float[] array) {
    foreach(ref val; array) {
        if (val <= 0.0) {
            val = 0.;
        }
    }

    return array;
}

unittest
{
    {
        float[] test = [1.0, 0.5, -1.0, 0.0, 0.3];
        float[] expected = [1.0, 0.5, 0.0, 0.0, 0.3];
        float[] res = relu(test);
        foreach(i; 0 .. res.length){
            assert(isClose(res[i], expected[i]),
                    "Element: " ~ i.to!string ~ " Mismatched");
        }
    }
}

void main() {
    writeln("Hello");
}
