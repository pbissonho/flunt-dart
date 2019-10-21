import 'package:flunt_dart/src/notifications/notificable.dart';

abstract class IContract implements Notifiable {
  IContract get contract;
  IContract requires();
}
