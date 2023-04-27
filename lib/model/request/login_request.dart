import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class LoginRequest extends DTO with EquatableMixin {
  static const _emailKey = 'username';
  static const _passwordKey = 'password';
  static const _timestamp = "timestamp";


  final String email;
  final String password;
  final String timestamp;

  LoginRequest({required this.email, required this.password, required this.timestamp});

  Map<String, dynamic> toJson() => {_emailKey: email, _passwordKey: password, _timestamp: timestamp};

  @override
  List<Object?> get props => [email, password, timestamp];
}