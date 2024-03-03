import 'package:mind_app/model/user.dart';
import 'package:mind_app/services/dto/user_dto.dart';
import 'package:pine/pine.dart';

class UserMapper extends DTOMapper<UserDTO, User> {
  @override
  User fromDTO(UserDTO dto) => User(
      id: dto.user!.id != null ? dto.user!.id! : '',
      name: dto.user!.name != null ? dto.user!.name! : '',
      registrationDate:
          dto.user!.registration != null ? dto.user!.registration! : '',
      birth: dto.user!.birth != null ? dto.user!.birth! : '',
      surname: dto.user!.surname != null ? dto.user!.surname! : '',
      email: dto.user!.email != null ? dto.user!.email! : '',
      lastLogin: dto.user!.lastLogin != null ? dto.user!.lastLogin! : '',
      token: dto.user!.token != null ? dto.user!.token! : '');

  @override
  UserDTO toDTO(User model) => UserDTO(
      user: UserDetailDTO(
          id: model.id,
          name: model.name,
          lastLogin: model.lastLogin,
          registration: model.registrationDate,
          surname: model.surname,
          email: model.email,
          token: model.token,
          birth: model.birth));
}
