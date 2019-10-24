
# Flunt-dart

[![Build Status](https://travis-ci.org/PedroBissonho/flunt-dart.svg?branch=master)](https://travis-ci.org/PedroBissonho/flunt-dart)
[![codecov](https://codecov.io/gh/PedroBissonho/flunt-dart/branch/master/graph/badge.svg)](https://codecov.io/gh/PedroBissonho/flunt-dart)

Library that provides a fluent way to use Notification Pattern. It is based on [Flunt](https://github.com/andrebaltieri/flunt).

## Usage

### Create a contract

Create a contract for a attribute ou a class.

``` dart
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
  CustomerContract(
    Customer customer,
  ) : super(customer, "Customer") {
    addNotifiable(NameContract(customer.firstName, "First Name"));
    addNotifiable(NameContract(customer.lastName, "Last Name"));
  }
}

```
### Use the contract
  
``` dart
  var customer = Customer("Pedro", "Bissonho");
  var customerContract = CustomerContract(customer);

  if (customerContract.valid) {
    // The customer is valid and can be used.
  }
```
