import 'package:flunt_dart/src/notifications/notification.dart';
import 'contracts/add_notifications.dart';

abstract class AddFrom {
  AddFrom();
  factory AddFrom.list(List<Notification> _notifications) {
    return _FromList(_notifications);
  }

  factory AddFrom.params(
    String property,
    final String message,
  ) {
    return _FromString(property, message);
  }

  void add(List<Notification> notifications);
}

class _FromNotification extends AddFrom {
  final Notification notification;

  _FromNotification(this.notification);

  @override
  void add(List<Notification> notifications) {
    notifications.add(notification);
  }
}

class _FromString extends AddFrom {
  final String property;
  final String message;

  _FromString(this.property, this.message);

  @override
  void add(List<Notification> notifications) {
    notifications.add(Notification(property, message));
  }
}

class _FromList extends AddFrom {
  final List<Notification> _notifications;

  _FromList(this._notifications);

  @override
  void add(List<Notification> notifications) {
    _notifications.addAll(notifications);
  }
}

class _FromNotifiables extends AddFrom {
  final List<Notifiable> _items;

  _FromNotifiables(this._items);

  @override
  void add(List<Notification> notifications) {
    _items.forEach((item) {
      notifications.addAll(item.notifications);
    });
  }
}

class Notifiable {
  List<Notification> _notifications;

  Notifiable() {
    _notifications = List<Notification>();
  }

  List<Notification> get notifications => _notifications;

  void addNotification(AddFrom addNotification) {
    addNotification.add(_notifications);
  }

  void addNotifiable(Notifiable notifiable) {
    notifications.addAll(notifiable.notifications);
  }

  void addNotifications(AddNotifications addNotifications) {
    addNotifications.add(_notifications);
  }

  bool get invalid => _notifications.isNotEmpty;
  bool get valid => !invalid;
}
