import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String userName;
  final String firstName;
  final String lastName;
  final String email;

  const User({
    required this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  List<Object> get props => [id, userName, firstName, lastName, email];

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String,
        userName: json['userName'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        email: json['email'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      };
}
