import 'package:flunt_dart/flunt_dart.dart';
import 'package:test/test.dart';

void main() {
  test("when contract is valid", () {
    var object = "Object";

    var contract = Contract(object, "Value");
    contract..isNotNull("message");
    expect(contract.valid, true);
    expect(contract.invalid, false);
    expect(contract.notifications.length, 0);
  });

  test("when contract is valid", () {
    var object;

    var contract = Contract(object, "Value");
    contract..isNull("message");
    expect(contract.valid, true);
    expect(contract.invalid, false);
    expect(contract.notifications.length, 0);
  });

  test("equasA - when is equas", () {
    var object = "String";
    var compare = "String";

    var contract = Contract(object, "Value");
    contract.equasA(compare, "Deve ser iqual");
    expect(contract.valid, true);
    expect(contract.invalid, false);
    expect(contract.notifications.length, 0);
  });
  test("equasA - when not is  equas", () {
    var object = "String";
    var compare = "Compare";

    var contract = Contract(object, "Value");
    contract.equasA(compare, "Deve ser iqual");
    expect(contract.valid, false);
    expect(contract.invalid, true);
    expect(contract.notifications.length, 1);
  });

  test("equasA - types diferentes", () {
    var object = "String";
    var compare = 222;

    var contract = Contract(object, "Value");
    contract.equasA(compare, "Deve ser iqual");
    expect(contract.valid, false);
    expect(contract.invalid, true);
    expect(contract.notifications.length, 1);
  });
}
