import 'package:dflunt/src/notifications/notificable.dart';

class Contract extends Notifiable {
  Contract requires() {
    return this;
  }

  Contract Join(List<Notifiable> items) {
    if (items != null) {
      items.forEach((notifiable) {
        if (notifiable.invalid) addNotifications(FromNotifiable(notifiable));
      });
    }

    return this;
  }

  /*
  Contract IfNotNull(Object parameterType,
      Expression<Func<Contract, Contract>> contractExpression) {
    if (parameterType != null) {
      contractExpression.Compile().Invoke(this);
    }

    return this;
  }
  */
}
