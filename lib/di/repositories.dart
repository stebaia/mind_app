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

    context.read<Dio>().interceptors.insert(
        0,
        AuthInterceptor(
            userRepository: userRepository,
            flutterSecureStorage: secureStorage));

    return userRepository;
  })),
  RepositoryProvider<DaysRepository>(create: ((context) {
    final userRepository = context.read<UserRepository>();
    final secureStorage = context.read<FlutterSecureStorage>();
    final dayRepository = DaysRepository(
        logger: context.read(),
        daysService: context.read(),
        dtoMapper: context.read(),
        dtoResultMapper: context.read());

    context.read<Dio>().interceptors.insert(
        0,
        AuthInterceptor(
            userRepository: userRepository,
            flutterSecureStorage: secureStorage));
    return dayRepository;
  })),
   RepositoryProvider<SecretNoteRepository>(create: ((context) {
    final secretNoteRepo = SecretNoteRepository(database: context.read(), logger: context.read());
    return secretNoteRepo;
  })),
];
