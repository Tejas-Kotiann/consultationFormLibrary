import 'package:equatable/equatable.dart';
//This will be super set of consult.
class Consult extends Equatable {
  final String firstName;
  final String lastName;
  final int phoneNumber;

  const Consult({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [firstName, lastName, phoneNumber];

  @override
  String toString() =>
      'Consult(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber)';
}
