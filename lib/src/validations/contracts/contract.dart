import 'package:flunt_dart/flunt_dart.dart';
import 'package:flunt_dart/src/notifications/notificable.dart';
import 'package:meta/meta.dart';

abstract class IContract implements Notifiable {
  requires();
}

abstract class IRule {
  @protected
  void addValidator(IValidate validate, message);
}
