part of 'dependency_injector.dart';

final List<SingleChildWidget> _mappers = [
  Provider<Mapper<User, String>>(
    create: (_) => UserToStringMapper(),
  ),
  Provider<DTOMapper<UserDTO, User>>(
    create: (_) => UserMapper(),
  ),
  Provider<DTOMapper<DaysDTO, DaysList>>(
    create: (_) => DaysListMapper(),
  ),
   Provider<DTOMapper<DayDTO, Day>>(
    create: (_) => DayMapper(),
  ),
   Provider<DTOMapper<DayResultDTO, DayResult>>(
    create: (_) => DayResultMapper(),
  ),
];
