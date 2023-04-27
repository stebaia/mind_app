import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class UserDTO extends DTO with EquatableMixin {
  UserDetailDTO? user;

  UserDTO({this.user});

  UserDTO.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserDetailDTO.fromJson(json['user']) : null;
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
 
class UserDetailDTO extends DTO with EquatableMixin{
  String? id;
  String? name;
  String? registrationDate;
  String? lastLogin;

  UserDetailDTO({this.id, this.name, this.registrationDate, this.lastLogin});

  UserDetailDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    registrationDate = json['registrationDate'];
    lastLogin = json['lastLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['registrationDate'] = this.registrationDate;
    data['lastLogin'] = this.lastLogin;
    return data;
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, name, registrationDate, lastLogin];
}