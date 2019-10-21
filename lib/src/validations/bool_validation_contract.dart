import 'package:flunt_dart/src/validations/contracts/contract.dart';
import 'package:flunt_dart/src/validators/bool_validator.dart';

mixin BoolValidation<T> implements IContract {
  void isTrue(String message) {
    addValidator(TrueValidator(), message);
  }

  void isFalse(String message) {
    addValidator(FalseValidator(), message);
  }
}
