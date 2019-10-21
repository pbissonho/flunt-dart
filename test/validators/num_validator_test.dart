import 'package:flunt_dart/src/validators/num_validator.dart';
import 'package:test/test.dart';

void main() {
  group("GreaterThanValidator (int with int)", () {
    test('IsGreaterThan', () {
      var validator = GreaterThanValidator(20);
      var result = validator.validate(60);
      expect(true, result);
    });

    test('IsGreaterThan - false', () {
      var validator = GreaterThanValidator(80);
      var result = validator.validate(60);
      expect(false, result);
    });
  });

  group("IsGreaterThan (int with float)", () {
    test('IsGreaterThan', () {
      var validator = GreaterThanValidator(20.0);
      var result = validator.validate(60);
      expect(true, result);
    });

    test('IsGreaterThan - false', () {
      var validator = GreaterThanValidator(80.0);
      var result = validator.validate(60);
      expect(false, result);
    });
  });
  group("IsGreaterThan (float with float)", () {
    test('IsGreaterThan', () {
      var validator = GreaterThanValidator(20.08);
      var result = validator.validate(20.09);
      expect(true, result);
    });

    test('IsGreaterThan - false', () {
      var validator = GreaterThanValidator(80.0);
      var result = validator.validate(79.999);
      expect(false, result);
    });
  });
}
