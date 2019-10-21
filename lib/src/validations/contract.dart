import 'package:flunt_dart/src/notifications/notificable.dart';
import 'package:flunt_dart/src/validations/string_validation_contract.dart';

import 'bool_validation_contract.dart';
import 'contracts/contract.dart';

class Contract extends Notifiable
    with BooleanValidationContract, StringValidationContract
    implements IContract {
  Contract join(List<Notifiable> items) {
    if (items != null) {
      items.forEach((notifiable) {
        if (notifiable.invalid) addNotification(AddFrom.notifiable(notifiable));
      });
    }

    return contract;
  }

  Contract get contract => this;

  @override
  Contract requires() => this;
}
