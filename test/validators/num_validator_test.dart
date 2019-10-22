import 'package:flunt_dart/src/validators/num_validator.dart';
import 'package:test/test.dart';

void main() {
  group("GreaterThanValidator ", () {
    group("When Compare int with float", () {
      test('true', () {
        var validator = GreaterThanValidator(20.089);
        var result = validator.validate(60);
        expect(true, result);
      });

      test('false', () {
        var validator = GreaterThanValidator(80.066);
        var result = validator.validate(60);
        expect(false, result);
      });
    });

    group("(When Compare float with float)", () {
      test('true', () {
        var validator = GreaterThanValidator(20.08);
        var result = validator.validate(20.09);
        expect(true, result);
      });

      test('false', () {
        var validator = GreaterThanValidator(80.0);
        var result = validator.validate(79.999);
        expect(false, result);
      });
    });

    group("(When Compare int with int)", () {
      test('true', () {
        var validator = GreaterThanValidator(20.00);
        var result = validator.validate(21.00);
        expect(true, result);
      });

      test('false', () {
        var validator = GreaterThanValidator(80.0);
        var result = validator.validate(90);
        expect(true, result);
      });
    });

    group("(When Compare int with double)", () {
      test('true', () {
        double value = 20.5555;
        var validator = GreaterThanValidator(20);
        var result = validator.validate(value);
        expect(true, result);
      });

      test('false', () {
        double value = 19.9999999;
        var validator = GreaterThanValidator(20);
        var result = validator.validate(value);
        expect(false, result);
      });
    });

    group("(When Compare double with double)", () {
      test('true', () {
        double value = 20.5555;
        double compare = 20.5554;

        var validator = GreaterThanValidator(compare);
        var result = validator.validate(value);
        expect(true, result);
      });

      test('false', () {
        double value = 20.5555555;
        double compare = 20.55556;
        var validator = GreaterThanValidator(compare);
        var result = validator.validate(value);
        expect(false, result);
      });
    });

    group("(When Compare double with double)", () {
      test('true', () {
        double value = 20.5555;
        double compare = 20.5554;

        var validator = GreaterThanValidator(compare);
        var result = validator.validate(value);
        expect(true, result);
      });

      test('false', () {
        double value = 20.5555555;
        double compare = 20.55556;
        var validator = GreaterThanValidator(compare);
        var result = validator.validate(value);
        expect(false, result);
      });
    });
  });
}
