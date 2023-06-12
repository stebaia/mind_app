import 'dart:convert';

import 'package:mind_app/model/user.dart';
import 'package:pine/pine.dart';

class UserToStringMapper extends Mapper<User, String> {
  @override
  String from(User from) => jsonEncode(<String, dynamic>{
        'id': from.id,
        'name': from.name,
        'registration': from.registration,
        'birth': from.birth,
        'email': from.email,
        'surname': from.surname,
        'lastLogin': from.lastLogin,
      });

  @override
  User to(String to) {
    final json = jsonDecode(to);
    return User(
        name: json['name'],
        lastLogin: json['lastLogin'],
        registration: json['registration'],
        email: json['email'],
        surname: json['surname'],
        birth: json['birth'],
        id: json['id']);
  }
}
