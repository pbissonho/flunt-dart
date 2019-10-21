import 'package:flunt_dart/src/notifications/notificable.dart';

import 'contract.dart';

abstract class IsGreaterThan<T extends num, R extends num> extends Contract {
  void isGreaterThan(T val, R comparer, String property, String message) {
    if (val <= comparer) addNotification(AddFrom.params(property, message));
  }
}

typedef void IsGreaterThanFunction<T extends num, R extends num>(
    T val, R comparer, String property, String message);

IsGreaterThanFunction normal = (val, comparer, property, message) {
  if (val <= comparer) print("TRUE");
};

IsGreaterThanFunction<double, double> isGreaterThanDouble = normal;

class NumValidationContract<T extends num, R extends num> extends Contract {
  Contract isGreaterThan(T val, R comparer, String property, String message) {
    if (val <= comparer) addNotification(AddFrom.params(property, message));
    return this;
  }

  Contract isGreaterOrEqualsThan(
      T val, R comparer, String property, String message) {
    if (val < comparer) addNotification(AddFrom.params(property, message));
    return this;
  }

  Contract isLowerThan(T val, R comparer, String property, String message) {
    if (val >= comparer) addNotification(AddFrom.params(property, message));
    return this;
  }

  Contract isLowerOrEqualsThan(
      T val, R comparer, String property, String message) {
    if (val > comparer) addNotification(AddFrom.params(property, message));
    return this;
  }

  Contract areEquals(T val, R comparer, String property, String message) {
    if (val == comparer) addNotification(AddFrom.params(property, message));
    return this;
  }

  Contract areNoEquals(T val, R comparer, String property, String message) {
    if (!(val == comparer)) addNotification(AddFrom.params(property, message));
    return this;
  }

  Contract isBetween(R val, R from, R to, String property, String message) {
    if (!(val >= from && val <= to)) {
      addNotification(AddFrom.params(property, message));
    }

    return this;
  }

  Contract isNullOrNullable(R val, String property, String message) {
    if (val == null) {
      addNotification(AddFrom.params(property, message));
    }
  }
}

class DoubleWithIntValidationContract
    extends NumValidationContract<int, double> {}

class DoubleWithDoubleValidationContract
    extends NumValidationContract<double, double> {}

void main() {
  DoubleWithDoubleValidationContract t = DoubleWithDoubleValidationContract();
  t.isBetween(2.2, 2.2, 8, "property", "message");
}
