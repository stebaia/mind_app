part of 'dependency_injector.dart';

final List<SingleChildWidget> _mappers = [
  Provider<Mapper<User, String>>(
    create: (_) => UserToStringMapper(),
  ),
  Provider<DTOMapper<UserDTO, User>>(
    create: (_) => UserMapper(),
  ),
];
