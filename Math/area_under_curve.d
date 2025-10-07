import std.stdio;
import std.math : abs;
import std.algorithm : swap;

double areaUnderCurve(F)(double start, double end, F func, ulong stepCount) 
    if (is(typeof(func(0.0)) == double))
{
    assert(stepCount > 0,
        "Step count must be non-zero/non-negative");

    if (start > end) {
        swap(start, end);
    }

    double stepLength = (end - start) / stepCount;
    double area = 0.0;
    double fx1 = func(start); 
    double fx2;

    foreach(i; 1 .. stepCount + 1) {  
        double evalpoint = cast(double)i * stepLength + start;
        fx2 = func(evalpoint);
        area += abs(fx2 + fx1) * stepLength * 0.5;
        fx1 = fx2;
    }

    return area;
}

unittest {
    auto linear = (double x) => x;
    double result = areaUnderCurve(0.0, 2.0, linear, 1000);
    assert(abs(result - 2.0) < 0.01);

    auto constant = (double x) => 3.0;
    result = areaUnderCurve(0.0, 4.0, constant, 100);
    assert(abs(result - 12.0) < 0.01);

    result = areaUnderCurve(2.0, 0.0, linear, 1000);
    assert(abs(result - 2.0) < 0.01);
}

void main() {
    auto square = (double x) => x * x;
    writeln("Area under x^2 from 0 to 1: ", areaUnderCurve(0.0, 1.0, square, 1000));
}
