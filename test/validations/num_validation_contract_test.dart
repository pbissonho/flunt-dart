import 'package:flunt_dart/flunt_dart.dart';
import 'package:test/test.dart';

void main() {
  group("isGreaterThan", () {
    test("isGreaterThan", () {
      int value1 = 30;
      int value2 = 80;

      var wrong = Contract(value1, "Value")..isGreaterThan(value2, "message");
      expect(wrong.valid, false);
      expect(wrong.invalid, true);
      expect(wrong.notifications.length, 1);

      var right = Contract(value2, "Value")..isGreaterThan(value1, "message");
      expect(right.valid, true);
      expect(right.invalid, false);
      expect(right.notifications.length, 0);
    });

    test("isLowerTha", () {
      int menor = 30;
      int maior = 80;

      var wrong = Contract(maior, "Value")..isLowerThan(menor, "message");
      expect(wrong.valid, false);
      expect(wrong.invalid, true);
      expect(wrong.notifications.length, 1);

      var right = Contract(menor, "Value")..isLowerThan(maior, "message");
      expect(right.valid, true);
      expect(right.invalid, false);
      expect(right.notifications.length, 0);
    });

    test("isLowerThan", () {
      int menor = 30;
      int maior = 80;

      var wrong = Contract(maior, "Value")..isLowerThan(menor, "message");
      expect(wrong.valid, false);
      expect(wrong.invalid, true);
      expect(wrong.notifications.length, 1);

      var right = Contract(menor, "Value")..isLowerThan(maior, "message");
      expect(right.valid, true);
      expect(right.invalid, false);
      expect(right.notifications.length, 0);
    });

    test("between", () {
      int from = 30;
      int betweenValue = 60;
      int to = 80;
      int notbetweenValue = 120;

      var wrong = Contract(notbetweenValue, "Value")
        ..between(from, to, "message");
      expect(wrong.valid, false);
      expect(wrong.invalid, true);
      expect(wrong.notifications.length, 1);

      var right = Contract(betweenValue, "Value")..between(from, to, "message");
      expect(right.valid, true);
      expect(right.invalid, false);
      expect(right.notifications.length, 0);
    });

    test("not between", () {
      int from = 30;
      int betweenValue = 60;
      int to = 80;
      int notbetweenValue = 120;

      var wrong = Contract(betweenValue, "Value")
        ..notBetween(from, to, "message");
      expect(wrong.valid, false);
      expect(wrong.invalid, true);
      expect(wrong.notifications.length, 1);

      var right = Contract(notbetweenValue, "Value")
        ..notBetween(from, to, "message");
      expect(right.valid, true);
      expect(right.invalid, false);
      expect(right.notifications.length, 0);
    });
  });
}
