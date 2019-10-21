import 'package:flunt_dart/src/notifications/notificable.dart';
import 'package:flunt_dart/src/validations/object_validation_contract.dart';
import 'package:flunt_dart/src/validations/pattern_validation_contract.dart';
import 'bool_validation_contract.dart';
import 'contracts/contract.dart';
import 'contracts/validatable.dart';
import 'string_validation_contract.dart';
import 'package:meta/meta.dart';

class Contract<T> extends Notifiable
    with BoolValidation, StringValidation, ObjectValidation, PatternValidation
    implements IContract {
  Contract(T property, String name) {
    _propertyName = name;
    _property = property;
  }

  T _property;
  String _propertyName;

  String get propertyName => _propertyName;
  T get property => _property;

  @override
  void requires() {
    if (this == null) {}
  }

  Contract join(List<Notifiable> items) {
    if (items != null) {
      items.forEach((notifiable) {
        if (notifiable.invalid) addNotifiable(notifiable);
      });
    }

    return this;
  }

  void add(Notifiable contract) {
    addNotifiable(contract);
  }

  void withValidate(IValidate<T> validator, String message) {
    addValidator(validator, message);
  }

  @override
  @protected
  void addValidator(IValidate validate, message) {
    if (!validate.validate(property)) {
      addNotification(AddFrom.params(propertyName, message));
    }
  }
}
