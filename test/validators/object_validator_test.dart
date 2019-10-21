import 'package:flunt_dart/src/validators/object_validator.dart';
import 'package:test/test.dart';

void main() {
  test('iquas - shoud true ', () {
    var sss = 1;
    var passwod = 1.002;
    var validator = EqualsValidator(sss);
    var result = validator.validate(passwod);
    expect(false, result);
  });

  group(("null tests"), () {
    test('isNotNull', () {
      var validator = NotNullValidator();
      int nullInt;
      var result = validator.validate(nullInt);
      expect(false, result);
    });
    test('isNotNull - expect ', () {
      var validator = NotNullValidator();
      int nullInt = 2;
      var result = validator.validate(nullInt);
      expect(true, result);
    });

    test('isNull - true', () {
      var validator = NullValidator();
      int nullInt;
      var result = validator.validate(nullInt);
      expect(true, result);
    });
    test('isNull - false ', () {
      var validator = NullValidator();
      int nullInt = 2;
      var result = validator.validate(nullInt);
      expect(false, result);
    });
  });
}
