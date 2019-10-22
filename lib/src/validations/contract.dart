import 'package:flunt_dart/src/notifications/notificable.dart';
import 'package:flunt_dart/src/notifications/notification.dart';
import 'package:flunt_dart/src/validations/num_validation_contract.dart';
import 'package:flunt_dart/src/validations/object_validation_contract.dart';
import 'package:flunt_dart/src/validations/pattern_validation_contract.dart';
import 'bool_validation_contract.dart';
import 'contracts/contract.dart';
import 'contracts/validatable.dart';
import 'string_validation_contract.dart';

class Contract<T> extends Notifiable
    with
        BoolValidation,
        StringValidation,
        ObjectValidation,
        PatternValidation,
        NumValidation
    implements IContract {
  Contract(this.property, this.name) : assert(name != null);

  final T property;
  final String name;

  @override
  void requires() {}

  Contract join(List<Notifiable> items) {
    if (items != null) {
      items.forEach((notifiable) {
        if (notifiable.invalid) addNotifiable(notifiable);
      });
    }

    return this;
  }

  @override
  void withValidator(IValidate validate, message) {
    try {
      if (!validate.validate(property)) {
        addNotification(Notification(name, message));
      }
    } catch (error) {
      throw Exception(
          """Error when ${validate.runtimeType.toString()} validate a property. \n
          Property name: ${name} \n
          Property: ${property} \n
          Error: ${error.toString()}
          """);
    }
  }
}
