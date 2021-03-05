part of 'model.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber
  });

  @override
  List<Object> get props => [
    id,
    name,
    email,
    phoneNumber
  ];

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"]
  );
}
