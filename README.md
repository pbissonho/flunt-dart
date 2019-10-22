
# Flunt-dart

[![Build Status](https://travis-ci.org/PedroBissonho/flunt-dart.svg?branch=master)](https://travis-ci.org/PedroBissonho/flunt-dart)
[![codecov](https://codecov.io/gh/PedroBissonho/flunt-dart/branch/master/graph/badge.svg)](https://codecov.io/gh/PedroBissonho/flunt-dart)

Library that provides a fluent way to use Notification Pattern. It is based on [Flunt](https://github.com/andrebaltieri/flunt) developed by @andrebaltieri.

## Usage

``` dart
var contract = Contract(property, "PropertyName")
      ..isNotEmpty("Message when property is empty.")
      ..hasMaxLen(20, "Message when property length is more than 20.")
      ..hasMinLen(3, "Message when property length is less than 3.");
```