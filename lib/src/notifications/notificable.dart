import 'package:flunt_dart/src/notifications/notification.dart';

class Notifiable {
  final List<Notification> _notifications;

  Notifiable() : _notifications = List<Notification>();

  List<Notification> forProperty(String property) {
    var listWhere =
        notifications.where((noti) => noti.property == property).toList();
    return List.unmodifiable(listWhere);
  }

  List<Notification> get notifications => List.unmodifiable(_notifications);

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
