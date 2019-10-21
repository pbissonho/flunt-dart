import 'package:flunt_dart/src/validations/contract.dart';
import 'package:test/test.dart';

void main() {
  test('isTrue', () {
    Contract wrong = Contract().isTrue(false, "boolean", "Boolean is false");
    expect(false, wrong.valid);
    expect(1, wrong.notifications.length);
    Contract right = Contract().isTrue(true, "boolean", "Boolean is false");
    expect(true, right.valid);
  });
  test('isFalse', () {
    Contract wrong = Contract().isFalse(true, "boolean", "Boolean is true");
    expect(1, wrong.notifications.length);

    Contract right = Contract().isFalse(false, "boolean", "Boolean is true");
    expect(true, right.valid);
  });
}
