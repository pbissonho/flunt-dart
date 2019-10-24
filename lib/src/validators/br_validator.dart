import 'package:flunt_dart/flunt_dart.dart';
import 'package:flunt_dart/src/validations/contracts/validatable.dart';
import 'package:flunt_dart/src/validators/num_validator.dart';
import 'package:flunt_dart/src/validators/pattern_validator.dart';

class CpfValidator implements IValidate<String> {
  static const invalidCpfList = [
    "11111111111",
    "00000000000",
    "22222222222",
    "33333333333",
    "44444444444",
    "55555555555",
    "66666666666",
    "77777777777",
    "88888888888",
    "99999999999",
  ];

  @override
  bool validate(String cpf) {
    if (cpf.isEmpty) return false;

    var cleanCpf = _clean(cpf);

    if (cleanCpf.length != 11) return false;

    if (!DigitValidator().validate(cleanCpf)) return false;

    if (invalidCpfList.contains(cleanCpf)) return false;

    if (!_validateDigit(cleanCpf, 9)) return false;

    if (!_validateDigit(cleanCpf, 10)) return false;

    return true;
  }

  String _clean(String cpf) {
    return cpf.replaceAll(RegExp(r'[^a-zA-Z 0-9]+'), '')
      ..trim()
      ..replaceAll(RegExp(r'\s+'), '');
  }

  bool _validateDigit(String cleanCpf, int digitPosition) {
    int sum = 0;

    var size = digitPosition + 1;

    for (int i = 0; i < digitPosition; i++) {
      sum += int.parse(cleanCpf[i]) * (size - i);
    }

    int digit = int.parse(cleanCpf[digitPosition]);
    var rest = (sum * 10) % 11;
    if (rest == 10 || rest == 11) rest = 0;
    if (rest == digit) return true;
    return false;
  }
}

class CepValidator implements IValidate<String> {
  @override
  bool validate(String value) {
    var clean = value..trim();

    if (!BetweenValidator(8, 9).validate(clean.length)) return false;
    return MatchsValidator(r'\d{5}-?\d{3}').validate(clean);
  }
}
