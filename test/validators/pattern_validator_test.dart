import 'package:flunt_dart/src/validators/pattern_validator.dart';
import 'package:test/test.dart';

void main() {
  group("EmailValidator", () {
    test("when email is valid", () {
      var result = EmailValidator().validate("pedro.bissonh@gmail.com");
      expect(true, result);
    });
    test("when email not have @ is not valid", () {
      var result = EmailValidator().validate("pedro.bissonhgmail.com");
      expect(false, result);
    });

    test("when email not have . is valid", () {
      var result = EmailValidator().validate("pedrobissonh@gmail.com");
      expect(true, result);
    });

    test("when email not have .com is not valid", () {
      var result = EmailValidator().validate("pedrobissonh@gmail");
      expect(false, result);
    });
    test("when email  have @@  is not valid", () {
      var result = EmailValidator().validate("pedro.bissonh@@gmail");
      expect(false, result);
    });

    test("when not is gmail", () {
      var result = EmailValidator().validate("pedro.bissonh@xuxu.com");
      expect(true, result);
    });
  });
}
