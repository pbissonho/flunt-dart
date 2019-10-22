import 'package:flunt_dart/src/validators/object_validator.dart';
import 'package:test/test.dart';

void main() {
  test(' WhenValidator ', () {
    var validator = WhenValidator((value) => value == 2);
    var right = validator.validate(2);
    var wrong = validator.validate(3);
    expect(true, right);
    expect(false, wrong);
  });

  group(("EqualsValidator"), () {
    test(' when value not is equal ', () {
      String stringValue = "String";
      var doubleValue = 1.002;
      var validator = EqualsValidator(stringValue);
      var result = validator.validate(doubleValue);
      expect(false, result);
    });

    test('when value is equal', () {
      String stringValue = "String";
      String stringValue2 = "String";
      var validator = EqualsValidator(stringValue);
      var result = validator.validate(stringValue2);
      expect(true, result);
    });
  });

  group(("Null Validators"), () {
    test('NotNullValidator when value is null', () {
      var validator = NotNullValidator();
      int nullInt;
      var result = validator.validate(nullInt);
      expect(false, result);
    });
    test('NotNullValidator when value is not null ', () {
      var validator = NotNullValidator();
      int nullInt = 2;
      var result = validator.validate(nullInt);
      expect(true, result);
    });

    test('NullValidator when value is null', () {
      var validator = NullValidator();
      int nullInt;
      var result = validator.validate(nullInt);
      expect(true, result);
    });
    test('NullValidator when value not is null', () {
      var validator = NullValidator();
      int nullInt = 2;
      var result = validator.validate(nullInt);
      expect(false, result);
    });
  });
}
