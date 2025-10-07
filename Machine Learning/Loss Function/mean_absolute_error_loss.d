import std.stdio;
import std.math : abs;
import std.range : zip;

double maeLoss(double[] predicted, double[] actual) {
    auto totalLoss = 0.0;
    foreach(tup; zip(predicted, actual)) {
        auto diff = tup[0] - tup[1];
        auto absoluteDiff = diff.abs;
        totalLoss += absoluteDiff;
    }

    return totalLoss / (predicted.length);
}

unittest {
    {
        double[] predVal = [1.0, 2.0, 3.0, 4.0];
        double[] actualVal = [1.0, 3.0, 3.5, 4.5];
        assert(maeLoss(predVal, actualVal) == 0.5);
    }
}

void main(){
    double[] predVal = [1, 5, 8, 9];
    double[] actualVal = [1, 7, 6, 12];

    writeln("The MAE loss is ",  maeLoss(predVal, actualVal));
}


