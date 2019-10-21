import 'package:flunt_dart/src/notifications/notificable.dart';
import 'package:flunt_dart/src/validations/object_validation_contract.dart';
import 'package:flunt_dart/src/validations/pattern_validation_contract.dart';
import 'bool_validation_contract.dart';
import 'contracts/contract.dart';
import 'contracts/validatable.dart';
import 'string_validation_contract.dart';
import 'package:meta/meta.dart';

class Contract<T> extends Notifiable implements IContract {
  Contract(this.objeto) {
    rules = Map<String, PropertyContract>();
  }

  T objeto;
  Map<String, PropertyContract> rules;

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

  void add(PropertyContract property) {
    var rule = property;

    rules[rule.propertyName] = rule;
    addNotifiable(rule);
  }
}

class PropertyContract<T> extends Notifiable
    with BoolValidation, StringValidation, ObjectValidation, PatternValidation {
  T _property;
  String _propertyName;

  String get propertyName => _propertyName;
  T get property => _property;

  PropertyContract(T property, String name) {
    _propertyName = propertyName;
    _property = property;
  }

  void forValue(T value) {
    _property = value;
  }

  void withName(String name) {
    _propertyName = name;
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
