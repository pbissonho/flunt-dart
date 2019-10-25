import 'package:flunt_dart/flunt_dart.dart';
import 'package:test/test.dart';

void main() {
  test("contains", () {
    var wrong = Contract("Some text here", "Text")
      ..constains("banana", "String does not contains banana");
    expect(false, wrong.valid);
    expect(true, wrong.invalid);
    expect(1, wrong.notifications.length);

    var right = Contract("banana is a fruit", "Text")
      ..constains("banana", "String does not contains banana");
    expect(true, right.valid);
    expect(false, right.invalid);
    expect(0, right.notifications.length);
  });

  test("isWhiteSpace", () {
    var wrong = Contract("Some text here", "Text")
      ..isWhiteSpace("String not is a WhiteSpace");
    expect(false, wrong.valid);
    expect(true, wrong.invalid);
    expect(1, wrong.notifications.length);

    var right = Contract("   ", "Text")
      ..isWhiteSpace("String not is a WhiteSpace");
    expect(true, right.valid);
    expect(false, right.invalid);
    expect(0, right.notifications.length);
  });

  test("hasMaxLen", () {
    var wrong = Contract("12345", "Value")
      ..hasMaxLen(3, "String len is more than permited");
    expect(false, wrong.valid);
    expect(true, wrong.invalid);
    expect(1, wrong.notifications.length);

    var right = Contract("123", "Value")
      ..hasMaxLen(3, "String len is more than permited");
    expect(true, right.valid);
    expect(false, right.invalid);
    expect(0, right.notifications.length);
  });

  test("hasMinLen", () {
    var wrong = Contract("12345", "Value")
      ..hasMinLen(6, "String len is less than permited");
    expect(false, wrong.valid);
    expect(true, wrong.invalid);
    expect(1, wrong.notifications.length);

    var right = Contract("123", "Value")
      ..hasMinLen(3, "String len is less than permited");
    expect(true, right.valid);
    expect(false, right.invalid);
    expect(0, right.notifications.length);
  });

  test("hasLen", () {
    var wrong = Contract("1234567", "Value")
      ..hasLen(6, "String len not is equas a 6");
    expect(false, wrong.valid);
    expect(true, wrong.invalid);
    expect(1, wrong.notifications.length);

    var right = Contract("123456", "Value")
      ..hasMinLen(6, "String len not is equas a 6");
    expect(true, right.valid);
    expect(false, right.invalid);
    expect(0, right.notifications.length);
  });

  test("isEmpty", () {
    var wrong = Contract("1234567", "Value")..isEmpty("String not is empty");
    expect(false, wrong.valid);
    expect(true, wrong.invalid);
    expect(1, wrong.notifications.length);

    var right = Contract("", "Value")..isEmpty("String not is empty");
    expect(true, right.valid);
    expect(false, right.invalid);
    expect(0, right.notifications.length);
  });

  test("notIsEmpty", () {
    var wrong = Contract("", "Value")..isNotEmpty("String is empty");
    expect(false, wrong.valid);
    expect(true, wrong.invalid);
    expect(1, wrong.notifications.length);

    var right = Contract("Right String", "Value")
      ..isNotEmpty("String is empty");
    expect(true, right.valid);
    expect(false, right.invalid);
    expect(0, right.notifications.length);
  });
}
