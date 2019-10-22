import 'package:flunt_dart/flunt_dart.dart';
import 'package:flunt_dart/src/validators/object_validator.dart';

mixin ObjectValidation<T> implements IContract {
  void isNull(String message) {
    addValidator(NullValidator(), message);
  }

  void isNotNull(String message) {
    addValidator(NotNullValidator(), message);
  }

  void equasA(Object compare, String message) {
    addValidator(EqualsValidator(compare), message);
  }

  void when(bool when(T value), String message) {
    addValidator(WhenValidator(when), message);
  }
}
