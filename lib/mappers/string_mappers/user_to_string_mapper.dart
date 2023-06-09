import 'dart:convert';

import 'package:mind_app/model/user.dart';
import 'package:pine/pine.dart';

class UserToStringMapper extends Mapper<User, String> {
  @override
  String from(User from) => jsonEncode(<String, dynamic>{
        'id': from.id,
        'name': from.name,
        'registrationDate': from.registrationDate,
        'lastLogin': from.lastLogin,
      
      });

  @override
  User to(String to) {
    final json = jsonDecode(to);
    return User(
        name: json['name'],
        lastLogin: json['lastLogin'],
        registrationDate: json['registrationDate'],
        id: json['id']);
  }
}
