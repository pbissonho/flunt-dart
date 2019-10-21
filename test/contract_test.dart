import 'package:flunt_dart/flunt_dart.dart';
import 'package:test/test.dart';

class Car {
  String name;
}

// Ony a examplo
class CpfValidator implements IValidate<String> {
  @override
  bool validate(value) {
    return true;
  }
}

abstract class BrContractValidation implements IContract {
  isCPF(String message) {
    addValidator(CpfValidator(), message);
  }
}

class BrContract<T> extends Contract<T> with BrContractValidation {
  BrContract(property, String name) : super(property, name);
}

class CarContract extends Contract {
  CarContract(Car car) : super(car, "Car") {
    add(BrContract(car.name, "Name")
      ..isNotEmpty("message")
      ..isCPF("message")
      ..exactLen(3, "message"));
  }
}

void main() {
  group("Contract", () {
    test("when contract is valid", () {
      var car = Car();
      car.name = "JJJ";
      var carContract = CarContract(car);

      expect(true, carContract.valid);
    });
    test("when contract is invalid", () {
      var car = Car();
      car.name = "JJddddddddddddddddJ";
      var carContract = CarContract(car);

      expect(false, carContract.valid);
    });
  });
}
