import 'package:flunt_dart/flunt_dart.dart';
import 'package:flunt_dart/src/notifications/notificable.dart';

abstract class IContract implements Notifiable {
  requires();
}
