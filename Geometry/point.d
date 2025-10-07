import std.stdio;
import std.math : pow, sqrt;

struct Point {
    double x;
    double y;

    this(double x, double y) {
        this.x = x;
        this.y = y;
    }

    Point opBinary(string op)(Point other) const if (op == "-") {
        return Point(this.x - other.x, this.y - other.y);
    }

    double consecutiveOrientation(Point b, Point c) {
        auto p1 = b - this;
        auto p2 = c - this;

        return p1.crossProd(p2);
    }

    double crossProd(Point other) const {
        return this.x * other.y - this.y * other.x;
    }

    double euclideanDistance(Point other) const {
        double dx = this.x - other.x;
        double dy = this.y - other.y;
        return sqrt(pow(dx, 2) + pow(dy, 2));
    }
}

