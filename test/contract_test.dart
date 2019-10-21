import 'package:flunt_dart/src/validations/contract.dart';
import 'package:test/test.dart';

class Car {
  String name;
}

class CarContract extends Contract<Car> {
  CarContract(Car car) : super(car) {
    add(PropertyContract(car.name, "Name")
      ..isNotEmpty("message")
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
