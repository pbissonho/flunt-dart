import 'package:flunt_dart/flunt_dart.dart';
import 'package:test/test.dart';

class InvalidValidator implements IValidate<String> {
  @override
  bool validate(value) {
    throw Exception("InvalidValidator");
  }
}

class FakeValidator implements IValidate<String> {
  @override
  bool validate(String value) {
    return false;
  }
}

void main() {
  group("Contract", () {
    test("join", () {
      var contract1 = Contract("String", "Some String");
      var contract2 = Contract("", "Some String");

      contract1.isEmail("Not is a valid email");
      contract2.isNotEmpty("String is empty");

      var contract3 = contract1.join([contract2]);

      expect(true, contract3.invalid);
      expect(false, contract3.valid);
      expect(2, contract3.notifications.length);
    });
    test("withValidate", () {
      var contract = Contract("String", "Some String")
        ..withValidator(FakeValidator(), "Fake");

      expect(true, contract.invalid);
      expect(false, contract.valid);
      expect(1, contract.notifications.length);
    });

    test("when validator trow a exception", () {
      try {
        Contract("String", "Some String")
          ..withValidator(InvalidValidator(), "Fake");
      } catch (error) {
        expect(error, isA<Exception>());
      }
    });
    test("when contract is invalid", () {});
  });
}
