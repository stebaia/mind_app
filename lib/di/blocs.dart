part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<AuthCubit>(
      create: (context) =>
          AuthCubit(userRepository: context.read(), context: context)
            ..checkAuthenticationState()),
  BlocProvider<RatingCubitCubit>(create: (context) => RatingCubitCubit()),
  BlocProvider<TagsCubit>(create: (context) => TagsCubit()),
];
