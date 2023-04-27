import 'package:mind_app/model/user.dart';
import 'package:mind_app/services/dto/user_dto.dart';
import 'package:pine/pine.dart';



class UserMapper extends DTOMapper<UserDTO, User> {
  @override
  User fromDTO(UserDTO dto) => User(
      id: dto.user!.id!,
      name: dto.user!.name!,
      registrationDate: dto.user!.registrationDate!,
      lastLogin: dto.user!.lastLogin!,
      );

  @override
  UserDTO toDTO(User model) => UserDTO(
    user: UserDetailDTO(id: model.id, name: model.name, lastLogin: model.lastLogin, registrationDate: model.registrationDate, )
  );
}