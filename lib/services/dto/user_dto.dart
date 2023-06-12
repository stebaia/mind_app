import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class UserDTO extends DTO with EquatableMixin {
  UserDetailDTO? user;

  UserDTO({this.user});

  UserDTO.fromJson(Map<String, dynamic> json) {
    user =
        json['user'] != null ? new UserDetailDTO.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class UserDetailDTO extends DTO with EquatableMixin {
  String? id;
  String? name;
  String? surname;
  String? email;
  String? birth;
  String? registration;
  String? lastLogin;

  UserDetailDTO(
      {this.id,
      this.name,
      this.registration,
      this.lastLogin,
      this.birth,
      this.email,
      this.surname});

  UserDetailDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    registration = json['registration'];
    birth = json['birth'];
    surname = json['surname'];
    email = json['email'];
    lastLogin = json['lastLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['registration'] = this.registration;
    data['email'] = this.email;
    data['surname'] = this.surname;
    data['birth'] = this.birth;
    data['lastLogin'] = this.lastLogin;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, registration, birth, surname, email, lastLogin];
}
