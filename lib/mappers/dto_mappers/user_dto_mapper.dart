import 'package:mind_app/model/user.dart';
import 'package:mind_app/services/dto/user_dto.dart';
import 'package:pine/pine.dart';

class UserMapper extends DTOMapper<UserDTO, User> {
  @override
  User fromDTO(UserDTO dto) => User(
      id: dto.user!.id!,
      name: dto.user!.name!,
      registrationDate: dto.user!.registration!,
      birth: dto.user!.birth!,
      surname: dto.user!.surname!,
      email: dto.user!.email!,
      lastLogin: dto.user!.lastLogin!,
      token: dto.user!.token);

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
