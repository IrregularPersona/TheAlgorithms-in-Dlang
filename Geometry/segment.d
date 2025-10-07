import Geometry.point;

import std.typecons : Tuple, tuple;
import std.math : abs;

const double TOLERANCE = 0.0001;

struct Segment {
    Point a;
    Point b;

    this(double x1, double y1, double x2, double y2) {
        this.a = Point(x1, y1);
        this.b = Point(x2, y2);
    }

    // Static factory method to create from points
    static Segment fromPoints(Point x, Point y) {
        Segment seg;
        seg.a = x;
        seg.b = y;
        return seg;
    }

    double direction(Point p) const {
        auto a = Point(p.x - this.a.x, p.y - this.a.y);
        auto b = Point(this.b.x - this.a.x, this.b.y - this.a.y);
        return a.crossProd(b);
    }

    bool isVert() const {
        return this.a.x == this.b.x;
    }

    Tuple!(double, double) getLineEquation() const {
        auto slope = (this.a.y - this.b.y) / (this.a.x - this.b.x);
        auto yInt = this.a.y - slope * this.a.x;
        return tuple(slope, yInt);
    }

    double computeYAtX(double x) const {
        auto pair = getLineEquation();
        return pair[0] * x + pair[1]; // slope * x + yInt
    }

    bool isColinear(Point p) const {
        if (this.isVert()) {
            return p.x == this.a.x;
        } else {
            return abs((computeYAtX(p.x) - p.y)) < TOLERANCE;
        }
    }

    bool colinearPointOnSegment(Point p) const {
        assert(this.isColinear(p), "p must be colinear");

        double minX, maxX, minY, maxY;

        if (this.a.x < this.b.x) {
            minX = this.a.x;
            maxX = this.b.x;
        } else {
            minX = this.b.x;
            maxX = this.a.x;
        }

        if (this.a.y < this.b.y) {
            minY = this.a.y;
            maxY = this.b.y;
        } else {
            minY = this.b.y;
            maxY = this.a.y;
        }

        return p.x >= minX && p.x <= maxX && p.y >= minY && p.y <= maxY;
    }

    bool onSegment(Point p) const {
        if (!this.isColinear(p)) {
            return false;
        }

        return this.colinearPointOnSegment(p);
    }

    bool intersects(Segment other) const {
        double direction1 = this.direction(other.a);
        double direction2 = this.direction(other.b);
        double direction3 = other.direction(this.a);
        double direction4 = other.direction(this.b);

        if ((direction1 > 0.0 && direction2 < 0.0) || (direction1 < 0.0 && direction2 > 0.0)) {
            if ((direction3 > 0.0 && direction4 < 0.0) || (direction3 < 0.0 && direction4 > 0.0)) {
                return true;
            }
        }

        return (abs(direction1) < TOLERANCE && this.colinearPointOnSegment(other.a))
            || (abs(direction2) < TOLERANCE && this.colinearPointOnSegment(other.b))
            || (abs(direction3) < TOLERANCE && other.colinearPointOnSegment(this.a))
            || (abs(direction4) < TOLERANCE && other.colinearPointOnSegment(this.b));
    }
}


