import 'package:flunt_dart/flunt_dart.dart';
import 'package:flunt_dart/src/validations/contracts/validatable.dart';
import 'package:flunt_dart/src/validators/num_validator.dart';
import 'package:flunt_dart/src/validators/pattern_validator.dart';

class CnpjValidator implements IValidate<String> {
  static const invalidCnpjList = [
    "00000000000000",
    "11111111111111",
    "22222222222222",
    "33333333333333",
    "44444444444444",
    "55555555555555",
    "66666666666666",
    "77777777777777",
    "88888888888888",
    "99999999999999",
  ];
  static const digitOneMask = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
  static const digitTwoMask = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];

  String _clean(String cpf) {
    return cpf.replaceAll(RegExp(r'[^a-zA-Z 0-9]+'), '')
      ..trim()
      ..replaceAll(RegExp(r'\s+'), '');
  }

  @override
  bool validate(String cnpj) {
    if (cnpj.isEmpty) return false;

    var cleanCnpj = _clean(cnpj);

    if (cleanCnpj.length != 14 || invalidCnpjList.contains(cleanCnpj)) {
      return false;
    }

    if (!_validateDigit(cleanCnpj, 12, digitOneMask)) return false;
    return _validateDigit(cleanCnpj, 13, digitTwoMask);
  }

  bool _validateDigit(
      String cleanCnpj, int digitPosition, List<int> multiplier) {
    int sum = 0;
    int informedDigit = int.parse(cleanCnpj[digitPosition]);
    int expectDigit;

    for (int i = 0; i < digitPosition; i++) {
      sum += int.parse(cleanCnpj[i]) * multiplier[i];
    }

    var rest = (sum % 11);
    if (rest < 2) {
      expectDigit = 0;
    } else {
      expectDigit = 11 - rest;
    }
    if (expectDigit == informedDigit) return true;
    return false;
  }
}

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
    var informedDigit = int.parse(cleanCpf[digitPosition]);
    var size = digitPosition + 1;

    for (int i = 0; i < digitPosition; i++) {
      sum += int.parse(cleanCpf[i]) * (size - i);
    }
    var rest = (sum * 10) % 11;
    if (rest == 10 || rest == 11) rest = 0;
    if (rest == informedDigit) return true;
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

/*
class BrPhoneValidator implements IValidate<String> {
  static const pattern =
      r"/^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$/";

  @override
  bool validate(String phone) {
    return MatchsValidator(pattern).validate(phone);
  }
}
*/
