import 'package:flunt_dart/src/validations/contract.dart';
import 'package:test/test.dart';

void main() {
  test('isNotNullOrEmpty', () {
    var wrong = Contract()
        .requires()
        .isNotNullOrEmpty(null, "string", "String is Null")
        .isNotNullOrEmpty("", "string", "String is Empty");
    expect(false, wrong.valid);
    expect(2, wrong.notifications.length);
    var right = Contract()
        .requires()
        .isNotNullOrEmpty("Some valid string", "string", "String is Null");
    expect(true, right.valid);
  });

  test('IsNotNullOrWhiteSpace', () {
    var wrong = Contract()
        .requires()
        .isNotNullOrWhiteSpace(null, "string", "String is Null")
        .isNotNullOrWhiteSpace("  ", "string", "String is Empty");
    expect(false, wrong.valid);
    expect(2, wrong.notifications.length);
    var right = Contract()
        .requires()
        .isNotNullOrWhiteSpace("Some valid string", "string", "String is Null");
    expect(true, right.valid);
  });

  test('IsNullOrEmpty', () {
    var right = Contract()
        .requires()
        .isNullOrEmpty(null, "string", "String is Null")
        .isNullOrEmpty("", "string", "String is Empty");

    expect(true, right.valid);
    expect(0, right.notifications.length);

    var wrong = Contract()
        .requires()
        .isNullOrEmpty("Some valid string", "string", "String is Null");
    expect(false, wrong.valid);
  });
}
