import 'package:dflunt/src/notifications/notificable.dart';
import 'contract.dart';
import 'contracts/contract.dart';

mixin BooleanValidationContract implements IContract {
  Contract isTrue(bool val, String property, String message) {
    if (!val) {
      addNotification(FromString(property, message));
    }
    return contract;
  }

  Contract isFalse(bool val, String property, String message) {
    if (val) {
      addNotification(FromString(property, message));
      ;
    }
    return contract;
  }
}
