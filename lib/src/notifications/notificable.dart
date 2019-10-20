import 'package:dflunt/src/notifications/notification.dart';
import 'contracts/add_notification.dart';
import 'contracts/add_notifications.dart';

class FromNotification implements AddNotification {
  final Notification notification;

  FromNotification(this.notification);

  @override
  void add(List<Notification> notifications) {
    notifications.add(notification);
  }
}

class FromString implements AddNotification {
  final String property;
  final String message;

  FromString(this.property, this.message);

  @override
  void add(List<Notification> notifications) {
    notifications.add(Notification(property, message));
  }
}

class FromList implements AddNotifications {
  final List<Notification> _notifications;

  FromList(this._notifications);

  @override
  void add(List<Notification> notifications) {
    _notifications.addAll(notifications);
  }
}

class FromNotifiable implements AddNotifications {
  final Notifiable _item;

  FromNotifiable(this._item);

  @override
  void add(List<Notification> notifications) {
    notifications.addAll(_item.notifications);
  }
}

class FromNotifiables implements AddNotifications {
  final List<Notifiable> _items;

  FromNotifiables(this._items);

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

  void addNotification(AddNotification addNotification) {
    addNotification.add(_notifications);
  }

  void addNotifications(AddNotifications addNotifications) {
    addNotifications.add(_notifications);
  }

  bool get invalid => _notifications.isNotEmpty;
  bool get valid => !invalid;
}
