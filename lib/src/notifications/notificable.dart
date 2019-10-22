import 'package:flunt_dart/src/notifications/notification.dart';

class Notifiable {
  List<Notification> _notifications;

  Notifiable() {
    _notifications = List<Notification>();
  }

  List<Notification> get notifications => _notifications;

  void addNotification(Notification notification) {
    _notifications.add(notification);
  }

  void addNotifications(List<Notification> items) {
    _notifications.addAll(items);
  }

  void addNotifiable(Notifiable notifiable) {
    notifications.addAll(notifiable.notifications);
  }

  void addNotifiables(List<Notifiable> notifiables) {
    notifiables.forEach((item) {
      notifications.addAll(item.notifications);
    });
  }

  bool get invalid => _notifications.isNotEmpty;
  bool get valid => !invalid;
}
