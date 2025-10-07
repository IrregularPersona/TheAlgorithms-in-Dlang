import std.stdio;
import std.math : abs, isNaN;

// newtons method
double square_root(double num, double tolerance = 1e-10) {
    if (num < 0.0) {
        return double.nan;
    }

    double root = 1.0;

    while (abs(root * root - num) > tolerance) {
        root -= (root * root - num) / (2.0 * root);
    }

    return root;
}

// based on the famous quake algorithm 
float fast_inv_sqrt(float num) {
    if (num < 0.0) {
        return float.nan;
    }

    int i;
    float x2, y;
    const float threehalfs = 1.5;

    x2 = num * 0.5;
    y = num;
    i = *cast(int*)&y;  // reinterpret float bits as int
    i = 0x5f3759df - (i >> 1);
    y = *cast(float*)&i;  // reinterpret int bits as float
    y = y * (threehalfs - (x2 * y * y));

    return y;
}

unittest {
    // test fast inv sqrt
    {
        assert(isNaN(fast_inv_sqrt(-1.0f)));

        auto testPairs = [
            [4.0f, 0.5f],
            [16.0f, 0.25f],
            [25.0f, 0.2f]
        ];
        
        foreach (pair; testPairs) {
            assert(abs(fast_inv_sqrt(pair[0]) - pair[1]) <= (0.01 * pair[0]));
        }
    }

    {
        assert(abs(square_root(4.0) - 2.0) <= 1e-10);
        assert(isNaN(square_root(-4.0)));
    }
}

void main() {
    writeln(fast_inv_sqrt(4.0f));
    writeln(square_root(4.0));
}
