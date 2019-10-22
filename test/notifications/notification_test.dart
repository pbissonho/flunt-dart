import 'package:flunt_dart/src/notifications/notification.dart';
import 'package:test/test.dart';

void main() {
  test("Notification", () {
    var notification = Notification("Name", "This a message");
    expect(notification.message, "This a message");
    expect(notification.property, "Name");
  });
}
