import 'package:flunt_dart/src/brasil_extension/br_validator.dart';

import '../../flunt_dart.dart';

mixin BrasilValidation<T> implements IContract {
  void isCpf(String message) {
    withValidator(CpfValidator(), message);
  }

  void isCnpj(String message) {
    withValidator(CnpjValidator(), message);
  }

  void isCep(String message) {
    withValidator(CepValidator(), message);
  }
}
