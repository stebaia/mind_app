import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class LoginRequest extends DTO with EquatableMixin {
  static const _emailKey = 'username';
  static const _passwordKey = 'password';

  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        _emailKey: email,
        _passwordKey: password,
      };

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
