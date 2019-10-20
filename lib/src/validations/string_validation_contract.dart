import 'package:dflunt/src/notifications/notificable.dart';
import 'contracts/contract.dart';

mixin StringValidationContract implements IContract {
  IContract isNotNullOrEmpty(String val, String property, String message) {
    if (val == null || val.isEmpty) {
      addNotification(FromString(property, message));
    }

    return contract;
  }

  IContract isNotNullOrWhiteSpace(String val, String property, String message) {
    if (val == null || val.isEmpty || val.contains(" ")) {
      addNotification(FromString(property, message));
    }
    return contract;
  }

  IContract isNullOrEmpty(String val, String property, String message) {
    if (!(val == null || val.isEmpty)) {
      addNotification(FromString(property, message));
    }

    return contract;
  }

  IContract isEmail(String email, String property, String message) {
    const String pattern = r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
    return matchs(email, pattern, property, message);
  }

  IContract isEmailOrEmpty(String email, String property, String message) {
    if (stringIsNullOrEmpty(email)) return this;
    const String pattern = r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
    return matchs(email, pattern, property, message);
  }

  IContract isUrl(String url, String property, String message) {
    const String pattern =
        r"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$";
    return matchs(url, pattern, property, message);
  }

  IContract isUrlOrEmpty(String url, String property, String message) {
    if (stringIsNullOrEmpty(url)) return this;

    return isUrl(url, property, message);
  }

  IContract isDigit(String text, String property, String message) {
    return matchs(text, r"^\d+$", property, message);
  }

  IContract matchs(
      String text, String pattern, String property, String message) {
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(text ?? "")) {
      addNotification(FromString(property, message));
    }

    return this;
  }

  IContract hasMinLengthIfNotNullOrEmpty(
      String text, int min, String property, String message) {
    if ((!stringIsNullOrEmpty(text)) && (text.length < min)) {
      addNotification(FromString(property, message));
    }
    return this;
  }

  IContract HasMaxLengthIfNotNullOrEmpty(
      String text, int max, String property, String message) {
    if ((!stringIsNullOrEmpty(text)) && (text.length > max)) {
      addNotification(FromString(property, message));
    }
    return this;
  }

  IContract hasExactLengthIfNotNullOrEmpty(
      String text, int len, String property, String message) {
    if ((!stringIsNullOrEmpty(text)) && (text.length != len)) {
      addNotification(FromString(property, message));
    }
    return this;
  }

  bool stringIsNullOrEmpty(String val) {
    return (val == null || val.isEmpty);
  }
}
