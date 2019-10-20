import 'package:dflunt/src/notifications/notificable.dart';
import 'package:dflunt/src/validations/string_validation_contract.dart';

import 'bool_validation_contract.dart';
import 'contracts/contract.dart';

class Contract extends Notifiable
    with BooleanValidationContract, StringValidationContract
    implements IContract {
  Contract join(List<Notifiable> items) {
    if (items != null) {
      items.forEach((notifiable) {
        if (notifiable.invalid) addNotifications(FromNotifiable(notifiable));
      });
    }

    return contract;
  }

  Contract get contract => this;
}
