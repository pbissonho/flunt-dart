import 'package:flunt_dart/src/notifications/notificable.dart';

import 'contract.dart';
import 'contracts/contract.dart';

mixin StringValidationContract implements IContract {
  Contract isNotNullOrEmpty(String val, String property, String message) {
    if (val == null || val.isEmpty) {
      addNotification(AddFrom.params(property, message));
    }

    return contract;
  }

  Contract isNotNullOrWhiteSpace(String val, String property, String message) {
    if (stringIsNullOrEmpty(val) || _ifCadaEspacoFormBranco(val)) {
      addNotification(AddFrom.params(property, message));
    }
    return contract;
  }

  bool _ifCadaEspacoFormBranco(String value) {
    var result = true;

    value.codeUnits.forEach((value) {
      if (value != " ".codeUnitAt(0)) {
        result = false;
      }
    });

    return result;
  }

  Contract isNullOrEmpty(String val, String property, String message) {
    if (!(val == null || val.isEmpty)) {
      addNotification(AddFrom.params(property, message));
    }

    return contract;
  }

  Contract isEmail(String email, String property, String message) {
    const String pattern = r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
    return matchs(email, pattern, property, message);
  }

  Contract isEmailOrEmpty(String email, String property, String message) {
    if (stringIsNullOrEmpty(email)) return this;
    const String pattern = r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
    return matchs(email, pattern, property, message);
  }

  Contract isUrl(String url, String property, String message) {
    const String pattern =
        r"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$";
    return matchs(url, pattern, property, message);
  }

  Contract isUrlOrEmpty(String url, String property, String message) {
    if (stringIsNullOrEmpty(url)) return this;

    return isUrl(url, property, message);
  }

  Contract isDigit(String text, String property, String message) {
    return matchs(text, r"^\d+$", property, message);
  }

  Contract matchs(
      String text, String pattern, String property, String message) {
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(text ?? "")) {
      addNotification(AddFrom.params(property, message));
    }

    return this;
  }

  Contract hasMinLengthIfNotNullOrEmpty(
      String text, int min, String property, String message) {
    if ((!stringIsNullOrEmpty(text)) && (text.length < min)) {
      addNotification(AddFrom.params(property, message));
    }
    return this;
  }

  Contract hasMaxLengthIfNotNullOrEmpty(
      String text, int max, String property, String message) {
    if ((!stringIsNullOrEmpty(text)) && (text.length > max)) {
      addNotification(AddFrom.params(property, message));
    }
    return this;
  }

  Contract hasExactLengthIfNotNullOrEmpty(
      String text, int len, String property, String message) {
    if ((!stringIsNullOrEmpty(text)) && (text.length != len)) {
      addNotification(AddFrom.params(property, message));
    }
    return this;
  }

  bool stringIsNullOrEmpty(String val) {
    return (val == null || val.isEmpty);
  }
}
