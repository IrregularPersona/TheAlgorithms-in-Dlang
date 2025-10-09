import std.stdio;
import std.math : log, isClose;
import std.range : zip;
import std.algorithm : all;

alias f64 = double;
alias f32 = float;

// following the rust result type
class NegativeLogLikelihood : Exception {
    this(string msg) { super(msg); }
}

f64 negLogLikelihood(f64[] yTrue, f64[] yPred) {
    if (yTrue.length != yPred.length) {
        throw new NegativeLogLikelihood("Inputs have different lengths.");
    }

    if (yPred.length == 0) {
        throw new NegativeLogLikelihood("Empty inputs.");
    }

    if (!valuesAreInRange(yTrue) || !valuesAreInRange(yPred)) {
        throw new NegativeLogLikelihood("Invalid values.");
    }

    f64 totalLoss = 0.0;

    foreach(tup; zip(yPred, yTrue)) {
        f64 loss = -tup[1] * log(tup[0]) - (1.0 - tup[1]) * log(1.0 - tup[0]);
        totalLoss += loss;
    }

    return totalLoss / cast(f64)yPred.length;
}

bool valuesAreInRange(f64[] yVal) {
    return yVal.all!(i => i >= 0.0 && i <= 1.0);
}

unittest
{
    assert(isClose(negLogLikelihood([1.0, 0.0, 1.0], [0.9, 0.1, 0.8]), 0.14462152754328741));
    assert(isClose(negLogLikelihood([1.0, 0.0, 1.0], [0.1, 0.2, 0.3]), 1.2432338162113972));
    assert(isClose(negLogLikelihood([0.0, 1.0, 0.0], [0.1, 0.2, 0.3]), 0.6904911240102196));
    assert(isClose(negLogLikelihood([1.0, 0.0, 1.0, 0.0], [0.9, 0.1, 0.8, 0.2]), 0.164252033486018));
}

void main() {

    writeln("Hello");
    
}
