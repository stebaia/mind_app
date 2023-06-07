part of 'dependency_injector.dart';


final List<RepositoryProvider> _repositories = [
  RepositoryProvider<UserRepository>(create: ((context) {
      final secureStorage = context.read<FlutterSecureStorage>();
      final userRepository = UserRepository(
          flutterSecureStorage: context.read(),
          userDTOMapper: context.read(),
          userService: context.read(),
          userMapper: context.read(),
          logger: context.read());
      return userRepository;
    })),
  RepositoryProvider<DaysRepository>(create: ((context) {
      
      final dayRepository = DaysRepository(
          
          logger: context.read(), daysService: context.read(), dtoMapper: context.read());
      return dayRepository;
    })),
];

