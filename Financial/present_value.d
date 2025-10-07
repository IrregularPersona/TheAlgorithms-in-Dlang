import std.stdio;
import std.math : pow;
import std.exception : enforce;
import std.math.rounding : lround;

double presentValue(double discountRate, double[] cashFlows) {
    enforce(discountRate >= 0.0, "Discount rate can't be negative.");
    enforce(cashFlows.length > 0, "Cash flow array can't be empty.");

    double pv = 0.0;
    foreach(i, cashFlow; cashFlows) {
        pv += cashFlow / pow(1.0 + discountRate, i);
    }

    return round(pv);
}

double round(double val) {
    return (val * 100.0).lround / 100.0;
}

unittest {
    import std.exception : assertThrown;
    import std.math : approxEqual;
    
    writeln("present value unit tests...");
    
    // successful cases 
    
    // general_inputs1
    {
        auto result = presentValue(0.13, [10.0, 20.70, -293.0, 297.0]);
        assert(result == 4.69, "general_inputs1 failed");
    }
    
    // general_inputs2  
    {
        auto result = presentValue(0.07, [-109129.39, 30923.23, 15098.93, 29734.0, 39.0]);
        assert(result == -42739.63, "general_inputs2 failed");
    }
    
    // general_inputs3
    {
        auto result = presentValue(0.07, [109129.39, 30923.23, 15098.93, 29734.0, 39.0]);
        assert(result == 175519.15, "general_inputs3 failed");
    }
    
    // zero_input
    {
        auto result = presentValue(0.0, [109129.39, 30923.23, 15098.93, 29734.0, 39.0]);
        assert(result == 184924.55, "zero_input failed");
    }
    
    writeln("all success test cases passed");
}

unittest {
    import std.exception : assertThrown;
    
    writeln("present value error tests...");
    
    // error cases 
    
    // negative_discount_rate
    {
        assertThrown!Exception(presentValue(-1.0, [10.0, 20.70, -293.0, 297.0]));
    }
    
    // empty_cash_flow
    {
        assertThrown!Exception(presentValue(1.0, []));
    }
    
    writeln("all error test cases passed");
}

unittest {
    writeln("Rounding func test");
   
    // rounding function 
    
    // test1
    {
        assert(round(0.55434) == 0.55, "round test1 failed");
    }
    
    // test2
    {
        assert(round(10.453) == 10.45, "round test2 failed");
    }
    
    // test3
    {
        assert(round(1111.0) == 1111.0, "round test3 failed");
    }
    
    writeln("all tests passed");
}

void main() {
    // example
    try {
        auto result1 = presentValue(0.13, [10.0, 20.70, -293.0, 297.0]);
        writefln("example 1: %.2f", result1);
        
        auto result2 = presentValue(0.07, [-109129.39, 30923.23, 15098.93, 29734.0, 39.0]);
        writefln("example 2: %.2f", result2);
        
        auto result3 = presentValue(0.0, [109129.39, 30923.23, 15098.93, 29734.0, 39.0]);
        writefln("example 3 (zero rate): %.2f", result3);
        
    } catch (Exception e) {
        writeln("Error: ", e.msg);
    }
}
