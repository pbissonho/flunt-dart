import 'package:flunt_dart/src/notifications/notificable.dart';
import 'package:flunt_dart/src/validations/object_validation_contract.dart';
import 'package:flunt_dart/src/validations/pattern_validation_contract.dart';
import 'bool_validation_contract.dart';
import 'contracts/contract.dart';
import 'contracts/validatable.dart';
import 'string_validation_contract.dart';

class Contract<T> extends Notifiable implements IContract {
  Contract(this.objeto) {
    rules = Map<String, RuleProperty>();
  }

  T objeto;
  Map<String, RuleProperty> rules;

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

  void contractFor(RuleProperty create(RuleProperty rule)) {
    var rule = create(RuleProperty(""));
    rules[rule.propertyName] = rule;

    addNotifiable(rule..validate());
  }
}

class RuleProperty<T> extends Notifiable
    with BoolValidation, StringValidation, ObjectValidation, PatternValidation
    implements IValidatable {
  Map<String, IValidate> map;
  T _property;
  String _propertyName;

  String get propertyName => _propertyName;
  T get property => _property;

  RuleProperty(T property, {String propertyName}) {
    map = Map<String, IValidate>();
    _propertyName = propertyName;
    _property = property;
  }

  void forValue(T value) {
    _property = value;
  }

  void withName(String name) {
    _propertyName = name;
  }

  void _addValidator(IValidate validate, message) {
    map[message] = validate;
  }

  void withValidate(IValidate<T> validator, String message) {
    _addValidator(validator, message);
  }

  @override
  void validate() {
    map.forEach((message, validator) {
      if (!validator.validate(property)) {
        addNotification(AddFrom.params(propertyName, message));
      } else {}
    });
  }
}
