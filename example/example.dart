import 'package:flunt_dart/flunt_dart.dart';

class Customer {
  final String firstName;
  final String lastName;

  Customer(this.firstName, this.lastName);
}

class NameContract extends Contract<String> {
  NameContract(String value, String name) : super(value, name) {
    isNotEmpty("not should be empty");
    hasMaxLen(40, "should have no more than 40 chars");
    hasMinLen(3, "should have at least 3 chars");
  }
}

class CustomerContract extends Contract<Customer> {
  CustomerContract(Customer user) : super(user, "Customer") {
    addNotifiable(NameContract(user.firstName, "First Name"));
    addNotifiable(NameContract(user.firstName, "Last Name"));
  }
}
