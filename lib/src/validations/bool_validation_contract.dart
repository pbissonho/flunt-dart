import 'package:flunt_dart/src/notifications/notificable.dart';

import 'contract.dart';
import 'contracts/contract.dart';

mixin BooleanValidationContract implements IContract {
  Contract isTrue(bool val, String property, String message) =>
      isFalse(!val, property, message);

  Contract isFalse(bool val, String property, String message) {
    if (val) {
      addNotification(AddFrom.params(property, message));
      ;
    }
    return contract;
  }
}
