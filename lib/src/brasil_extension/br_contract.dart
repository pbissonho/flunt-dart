import 'package:flunt_dart/flunt_dart.dart';
import 'package:flunt_dart/src/brasil_extension/br_validation_contract.dart';

class BrContract<T> extends Contract<T> with BrasilValidation {
  BrContract(T property, String name) : super(property, name);
}
