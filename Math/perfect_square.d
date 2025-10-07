import std.stdio;
import std.math : sqrt;

bool perfect_square(int num) {
    if (num < 0) return false;
    int sqrt_num = cast(int)sqrt(cast(real)num);
    return sqrt_num * sqrt_num == num;
}

bool perfect_square_b_search(int num) {
    if (num < 0) return false;

    int left = 0;
    int right = num;

    while (left <= right) {
        int mid = left + (right - left) / 2;
        long mid_squared = cast(long)mid * mid;

        if (mid_squared == num) {
            return true;
        } else if (mid_squared > num) {
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }

    return false;
}

unittest {
    assert(perfect_square(0) == true);
    assert(perfect_square(1) == true);
    assert(perfect_square(4) == true);
    assert(perfect_square(9) == true);
    assert(perfect_square(16) == true);
    assert(perfect_square(25) == true);
    assert(perfect_square(2) == false);
    assert(perfect_square(3) == false);
    assert(perfect_square(8) == false);
    assert(perfect_square(-1) == false);

    assert(perfect_square_b_search(0) == true);
    assert(perfect_square_b_search(1) == true);
    assert(perfect_square_b_search(4) == true);
    assert(perfect_square_b_search(9) == true);
    assert(perfect_square_b_search(16) == true);
    assert(perfect_square_b_search(25) == true);
    assert(perfect_square_b_search(2) == false);
    assert(perfect_square_b_search(3) == false);
    assert(perfect_square_b_search(8) == false);
    assert(perfect_square_b_search(-1) == false);
}

void main() {
    // first function
    writeln("16 is perfect square: ", perfect_square(16));
    writeln("15 is perfect square: ", perfect_square(15));

    // second function
    writeln("16 is perfect square: ", perfect_square_b_search(16));
    writeln("15 is perfect square: ", perfect_square_b_search(15));
}
