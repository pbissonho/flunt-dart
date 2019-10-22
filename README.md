
# Flunt-dart

Library that provides a fluent way to use Notification Pattern. It is based on Flunt (.NET) developed by @andrebaltieri.

## Usage

``` dart
var contract = Contract(property, "PropertyName")
      ..isNotEmpty("Message when property is empty.")
      ..hasMaxLen(20, "Message when property length is more than 20.")
      ..hasMinLen(3, "Message when property length is less than 3.");
``` dart