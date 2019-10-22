import 'package:flunt_dart/flunt_dart.dart';
import 'package:test/test.dart';

void main() {
  test("isDigit", () {
    var wrong = Contract("1555fdfsd555", "Value")
      ..isDigit("String must have digits only");
    expect(false, wrong.valid);
    expect(true, wrong.invalid);
    expect(1, wrong.notifications.length);

    var right = Contract("158888", "Value")
      ..isDigit("String must have digits only");
    expect(true, right.valid);
    expect(false, right.invalid);
    expect(0, right.notifications.length);
  });

  test("matchs", () {
    var wrong = Contract("1555fdfsd555", "Value")
      ..matchs(r"^\d+$", "String must have digits only");
    expect(false, wrong.valid);
    expect(true, wrong.invalid);
    expect(1, wrong.notifications.length);

    var right = Contract("158888", "Value")
      ..matchs(r"^\d+$", "String must have digits only");
    expect(true, right.valid);
    expect(false, right.invalid);
    expect(0, right.notifications.length);
  });

  test("isUrl", () {
    var wrong = Contract("Text", "Url")..isUrl("Invalid URL");
    expect(false, wrong.valid);
    expect(true, wrong.invalid);
    expect(1, wrong.notifications.length);

    var right = Contract("https://gmail.com", "Url")..isUrl("Invalid URL");
    expect(true, right.valid);
    expect(false, right.invalid);
    expect(0, right.notifications.length);
  });

  test("isEmail", () {
    var wrong = Contract("Text", "Email")..isEmail("Invalid E-mail");

    expect(false, wrong.valid);
    expect(true, wrong.invalid);
    expect(1, wrong.notifications.length);

    var right = Contract("pedro.bissonho@gmail.com", "Email")
      ..isEmail("E-mail");
    expect(true, right.valid);
    expect(false, right.invalid);
    expect(0, right.notifications.length);
  });
}
