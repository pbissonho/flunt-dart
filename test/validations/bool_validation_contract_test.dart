import 'package:flunt_dart/flunt_dart.dart';
import 'package:test/test.dart';

void main() {
  group("isTrue", () {
    test("when contract is valid", () {
      var contract = Contract(true, "Value");
      contract..isTrue("Value not is true");
      expect(contract.property, isA<bool>());
      expect(contract.valid, true);
      expect(contract.invalid, false);
      expect(contract.notifications.length, 0);
    });

    test("when  contract not is valid", () {
      var contract = Contract(false, "Value");
      contract..isTrue("Value not is true");
      expect(contract.property, isA<bool>());
      expect(contract.valid, false);
      expect(contract.invalid, true);
      expect(contract.notifications.length, 1);
    });
  });

  group("isFalse", () {
    test("when contract not is valid", () {
      var contract = Contract(true, "Value");
      contract..isFalse("Value not is false");
      expect(contract.property, isA<bool>());
      expect(contract.valid, false);
      expect(contract.invalid, true);
      expect(contract.notifications.length, 1);
    });

    test("when contract is valid", () {
      var contract = Contract(false, "Value");
      contract..isFalse("Value not is false");
      expect(contract.property, isA<bool>());
      expect(contract.valid, true);
      expect(contract.invalid, false);
      expect(contract.notifications.length, 0);
    });
  });
}
