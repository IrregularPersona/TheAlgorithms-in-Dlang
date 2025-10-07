import std.stdio;

const int[12] T = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];

int doomsday(int year, int month, int day) {
    if (month < 3) {
        year -= 1;
    }

    return (year + year / 4 - year / 100 + year / 400 + T[(month - 1)] + day) % 7;
}

string getWeekDay(int year, int month, int day) {
    int dayOfWeek = doomsday(year, month, day);
    string[int] day_str = [
        0: "Sunday",
        1: "Monday",
        2: "Tuesday",
        3: "Wednesday",
        4: "Thursday",
        5: "Friday",
        6: "Saturday"
    ];

    return day_str[dayOfWeek];
}

unittest {
    assert(getWeekDay(1990, 3, 21) == "Wednesday");
    assert(getWeekDay(2000, 8, 24) == "Thursday");
    assert(getWeekDay(2000, 10, 13) == "Friday");
    assert(getWeekDay(2001, 4, 18) == "Wednesday");
    assert(getWeekDay(2002, 3, 19) == "Tuesday");
}

void main() {
    writeln(getWeekDay(1990, 3, 21));
    writeln(getWeekDay(2000, 8, 24));
    writeln(getWeekDay(2000, 10, 13));
    writeln(getWeekDay(2001, 4, 18));
    writeln(getWeekDay(2002, 3, 19));
}
