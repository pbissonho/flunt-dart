abstract class IValidatable {
  void validate();
}

abstract class IValidate<T> {
  bool validate(T value);
}
