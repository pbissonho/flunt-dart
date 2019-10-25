
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

### BrContract

##### O BrContract prove validações especificas para o Brasil.
``` dart
// Métodos atualmente disponíveis.
isCep("O CEP não é válido.")
isCnpj("O CPNJ não é válido")
isCpf("O CPF não é válido");
```
##### The BrContract provides specific validations for brazil.
``` dart
// Methods currently available.
isCep("O CEP not is valid.")
isCnpj("O CPNJ not is valid")
isCpf("O CPF not is valid");
```


## Validations
  
#### Num

``` dart
void isGreaterThan(int compare, String message);
void isLowerThan(int compare, String message);
void between(num from, num to, String message);
void notBetween(num from, num to, String message);
 ```  
#### String

``` dart
void hasLen(int length, String message);
void hasMaxLen(int max, String message);
void hasMinLen(int min, String message);
void isWhiteSpace(String message); 
void constains(String value, String message);
void isNotEmpty(String message); 
void isEmpty(String message);
void notIsEmpty(String message);
 ``` 

#### Object

``` dart
void isNull(String message)
void isNotNull(String message)
void equasA(Object compare, String message); 
 ``` 


#### Pattern

``` dart
void matchs(String pattern, String message);
void isUrl(String message);
void isEmail(String message);
void isDigit(String message);
``` 

#### Bool

``` dart
void isTrue(String message);
void isFalse(String message); 
``` 

#### Bool

``` dart
void isTrue(String message);
void isFalse(String message); 
``` 

## Credits

This library uses concepts and implementations based from the following repositories.

- [Flunt](https://github.com/andrebaltieri/flunt) by [Andre Baltieri](https://github.com/andrebaltieri)

- [Flunt.Br](https://github.com/andrebaltieri/flunt) by [Alan Lira](https://github.com/lira92)