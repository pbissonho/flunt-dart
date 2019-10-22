import 'package:flunt_dart/flunt_dart.dart';
import 'package:test/test.dart';

class Car {
  final String name;
  final int year;
  Car(this.name, this.year);
}

// Ony a example
class CpfValidator implements IValidate<String> {
  @override
  bool validate(value) {
    return true;
  }
}

mixin BrContractValidation implements IContract {
  isCPF(String message) {
    addValidator(CpfValidator(), message);
  }
}

class BrContract<T> extends Contract<T> with BrContractValidation {
  BrContract(property, String name) : super(property, name);
}

class CarContract extends Contract {
  CarContract(Car car) : super(car, "Car") {
    addNotifiable(
        BrContract(car.name, "Name")..isNotEmpty("Não deve ser vazio"));

    addNotifiable(Contract(car.year, "Year")
      ..isGreaterThan(2010, "Carro deve ser novo")
      ..isNotNull("Não deve ser null"));
  }
}

void main() {
  group("Contract", () {
    test("when contract is valid", () {
      var car = Car("BMW-Z", 2015);

      var carContract = CarContract(car);

      expect(true, carContract.valid);
    });
    test("when contract is invalid", () {
      bool isCpfValid = CpfValidator().validate("18964039726");

      expect(true, isCpfValid);
      var car = Car("BMW-XXXXXXXXXX", 2008);

      var carContract = CarContract(car);

      expect(false, carContract.valid);
    });
  });
}
