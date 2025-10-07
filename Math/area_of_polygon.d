import std.stdio;
import std.math : abs;

struct Point {
    double x;
    double y;
}

double areaOfPolygon(Point[] fig) {
    double res = 0.0;

    foreach(i; 0 .. fig.length) {
        Point p = (i > 0) ? fig[i - 1] : fig[$ - 1];  
        Point q = fig[i];

        res += (p.x - q.x) * (p.y + q.y);
    }

    return abs(res) / 2.0;
}

unittest {
    Point[] triangle = [
        Point(0, 0),
        Point(4, 0),
        Point(4, 3)
    ];
    assert(abs(areaOfPolygon(triangle) - 6.0) < 0.0001);

    // Square with vertices at (0,0), (2,0), (2,2), (0,2)
    Point[] square = [
        Point(0, 0),
        Point(2, 0),
        Point(2, 2),
        Point(0, 2)
    ];
    assert(abs(areaOfPolygon(square) - 4.0) < 0.0001);
}

void main() {
    Point[] triangle = [Point(0, 0), Point(4, 0), Point(4, 3)];
    writeln("Area of triangle: ", areaOfPolygon(triangle));
}
