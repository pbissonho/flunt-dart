import 'package:flunt_dart/src/validations/contracts/contract.dart';
import 'package:flunt_dart/src/validators/bool_validator.dart';

mixin BoolValidation<T> implements IContract {
  void isTrue(String message) {
    withValidator(TrueValidator(), message);
  }

  void isFalse(String message) {
    withValidator(FalseValidator(), message);
  }
}
