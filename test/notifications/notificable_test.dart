import 'package:flunt_dart/src/notifications/notificable.dart';
import 'package:flunt_dart/src/notifications/notification.dart';
import 'package:test/test.dart';

void main() {
  test("whn add a notification", () {
    var notifiable = Notifiable();
    notifiable.addNotification(Notification("Name", "Message"));

    expect(notifiable.invalid, true);
    expect(notifiable.notifications.length, 1);
  });

  test("whn add a list of notification", () {
    var notifiable = Notifiable();
    notifiable.addNotifications(
        [Notification("Name", "Message"), Notification("Name", "Message")]);

    expect(notifiable.invalid, true);
    expect(notifiable.notifications.length, 2);
  });
  test("whn add a Notifiable to a Notifiable", () {
    var other = Notifiable();
    other.addNotification(Notification("Name", "Message"));

    var notifiable = Notifiable()..addNotifiable(other);

    expect(notifiable.invalid, true);
    expect(notifiable.notifications.length, 1);
  });

  test("whn add a List of Notifiable", () {
    var list = [Notifiable(), Notifiable(), Notifiable()];

    list.forEach((f) => f.addNotification(Notification("Name", "Message")));

    var notifiable = Notifiable()..addNotifiables(list);

    expect(notifiable.invalid, true);
    expect(notifiable.notifications.length, 3);
  });

  test("whn add a List of Notifiable", () {
    var list = [Notifiable(), Notifiable(), Notifiable()];

    list.forEach((f) => f.addNotification(Notification("Name", "Message")));

    var notifiable = Notifiable()..addNotifiables(list);

    expect(notifiable.invalid, true);
    expect(notifiable.notifications.length, 3);
  });
}
