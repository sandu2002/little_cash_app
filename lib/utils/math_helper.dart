class MathHelper {
  ///Scales the [currentValue] into a [newValue] while maintaining the correct ratio between the range of [newMin] and [newMax].
  static double valToNewRange({
    required double currentValue,
    required double oldMin,
    required double oldMax,
    required double newMin,
    required double newMax,
  }) {
    var isInRange = currentValue >= oldMin && currentValue <= oldMax;
    if (!isInRange) throw RangeError('currentValue must be in between the oldMin and oldMax');

    //Linear Conversion
    var newValue = (((currentValue - oldMin) * (newMax - newMin)) / (oldMax - oldMin)) + newMin;
    return newValue;
  }
}