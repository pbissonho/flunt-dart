import 'package:flunt_dart/src/validators/string_validator.dart';
import 'package:test/test.dart';

void main() {
  test("HasExactLengthValidator", () {
    var nasExactLengthValidator = HasExactLengthValidator(5);
    var valid = nasExactLengthValidator.validate("12345");
    var notValid = nasExactLengthValidator.validate("123");
    expect(true, valid);
    expect(false, notValid);
  });

  group("StringValidator", () {
    test("when is true", () {
      var result = ContainsValidator("is").validate("This is a string");
      expect(true, result);
    });
    test("when is false", () {
      var result = ContainsValidator("not").validate("This is a string");
      expect(false, result);
    });

    test("when is a space", () {
      var result = SpaceValidator().validate("  ");
      expect(true, result);
    });

    test("when not is a space", () {
      var result = SpaceValidator().validate(" F ");
      expect(false, result);
    });

    group("EmptyValidator", () {
      test("when is empty", () {
        var result = EmptyValidator().validate("");
        expect(true, result);
      });
      test("when not is empty", () {
        var result = EmptyValidator().validate("sdsds");
        expect(false, result);
      });
    });
    group("NotEmptyValidator", () {
      test("when is empty", () {
        var result = NotEmptyValidator().validate("dsdasda");
        expect(true, result);
      });
      test("when not is empty", () {
        var result = NotEmptyValidator().validate("");
        expect(false, result);
      });
    });

    group("HasMaxLenValidator", () {
      var hasMaxValidator = HasMaxLenValidator(5);
      test("when have size is less", () {
        var result = hasMaxValidator.validate("1234");
        expect(true, result);
      });
      test("when size ir more", () {
        var result = hasMaxValidator.validate("123456");
        expect(false, result);
      });
      test("when size ir iqual", () {
        var result = hasMaxValidator.validate("12345");
        expect(true, result);
      });
    });

    group("HasMinLenValidator", () {
      var hasMinValidator = HasMinLenValidator(5);
      test("when have size is less", () {
        var result = hasMinValidator.validate("123");
        expect(false, result);
      });
      test("when size ir more", () {
        var result = hasMinValidator.validate("123456");
        expect(true, result);
      });
      test("when size ir iqual", () {
        var result = hasMinValidator.validate("12345");
        expect(true, result);
      });
    });
  });
}
