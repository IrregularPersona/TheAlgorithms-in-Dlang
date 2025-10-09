import std.stdio;
import std.math : sqrt, pow;
import std.algorithm : map, sum;
import std.typecons : Tuple, tuple;

Tuple!(double, double) linear_regression(Tuple!(double, double)[] dataPoints) {
    if (dataPoints.length == 0) {
        return tuple(0.0, 0.0);
    }

    double count = cast(double)dataPoints.length;
    double meanX = dataPoints.map!(p => p[0]).sum / count;
    double meanY = dataPoints.map!(p => p[1]).sum / count;

    double covariance = 0.0;
    double stdDevSqrX = 0.0;
    double stdDevSqrY = 0.0;

    foreach (point; dataPoints) {
        double x = point[0];
        double y = point[1];
        covariance += (x - meanX) * (y - meanY);
        stdDevSqrX += pow(x - meanX, 2);
        stdDevSqrY += pow(y - meanY, 2);
    }

    double stdDevX = sqrt(stdDevSqrX);
    double stdDevY = sqrt(stdDevSqrY);
    double stdDevProd = stdDevX * stdDevY;

    double pcc = covariance / stdDevProd;   // Pearson's correlation
    double b = pcc * (stdDevY / stdDevX);   // slope
    double a = meanY - b * meanX;           // y-intercept
    
    return tuple(a, b);
}


unittest {
    import std.math : isClose;
    
    // empty data
    auto result = linear_regression([]);
    assert(result[0] == 0.0 && result[1] == 0.0);
    
    // simple linear data: y = 2x + 1
    auto data = [
        tuple(1.0, 3.0),   // y = 2*1 + 1
        tuple(2.0, 5.0),   // y = 2*2 + 1
        tuple(3.0, 7.0),   // y = 2*3 + 1
        tuple(4.0, 9.0),   // y = 2*4 + 1
        tuple(5.0, 11.0)   // y = 2*5 + 1
    ];
    
    result = linear_regression(data);
    assert(isClose(result[0], 1.0)); // intercept = 1
    assert(isClose(result[1], 2.0)); // slope = 2
    
    // another linear data: y = -3x + 7
    auto data2 = [
        tuple(0.0, 7.0),
        tuple(1.0, 4.0),
        tuple(2.0, 1.0)
    ];
    
    result = linear_regression(data2);
    assert(isClose(result[0], 7.0));  // intercept = 7
    assert(isClose(result[1], -3.0)); // slope = -3
}

void main() {
    // fitting line y = 2x + 1 with some noise
    auto data = [
        tuple(1.0, 3.1),
        tuple(2.0, 4.9),
        tuple(3.0, 7.2),
        tuple(4.0, 8.8),
        tuple(5.0, 11.1)
    ];
    
    auto result = linear_regression(data);
    writeln("Linear regression: y = ", result[1], "x + ", result[0]);
    writeln("Slope (b): ", result[1]);
    writeln("Intercept (a): ", result[0]);
}
