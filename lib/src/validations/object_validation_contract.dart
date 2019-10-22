import 'package:flunt_dart/flunt_dart.dart';
import 'package:flunt_dart/src/validators/object_validator.dart';

mixin ObjectValidation<T> implements IContract {
  void isNull(String message) {
    withValidator(NullValidator(), message);
  }

  void isNotNull(String message) {
    withValidator(NotNullValidator(), message);
  }

  void equasA(Object compare, String message) {
    withValidator(EqualsValidator(compare), message);
  }
}
