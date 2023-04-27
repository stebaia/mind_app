import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String registrationDate;
  final String lastLogin;

  User(
      {required this.id,
      required this.name,
      required this.registrationDate,
      required this.lastLogin,
     });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        registrationDate,
        lastLogin
      ];
}
