import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:mind_app/bloc/cubit/rating_cubit/rating_cubit_cubit.dart';
import 'package:mind_app/bloc/cubit/tags_cubit/tags_cubit.dart';
import 'package:mind_app/bloc/day_bloc/day_bloc.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/theme_helper.dart';

class MainPage extends StatelessWidget with AutoRouteWrapper {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tagsCubit = context.read<TagsCubit>();
    final ragingCubit = context.read<RatingCubitCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: ((context, state) {
        try {
          if (state is AuthenticatedState) {
            context.read<DayBloc>()
              ..getDay(
                  userId: state.user.id,
                  dayFrom: DateConverter.getDateNowWithFormatSimples(),
                  dayTo: DateConverter.getDateNowWithFormatSimples());
          } else if (state is NotAuthenticatedState) {
            _replacePage(context, const LoginRoute());
          }
        } catch (e) {
          _replacePage(context, LoginRoute());
        }
      }),
      child: Scaffold(
        backgroundColor: ThemeHelper.backgroundColorWhite,
        body: BlocListener<DayBloc, DayState>(
          listener: (context, state) {
            tagsCubit.deleteAll();
            ragingCubit.changeValue(3);
            if (state is EmptyGetDayState) {
              _replacePage(context, SetDayEmojiRoute(isFirstTime: true));
            } else if (state is ResultGetDayState) {
              _replacePage(context,CoreRoute());
            }
          },
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Future<void> _replacePage(
      BuildContext context, PageRouteInfo routeInfo) async {
    //context.router.popUntilRoot();
    await context.router.push(routeInfo);
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<DayBloc>(
            create: ((context) => DayBloc(daysRepository: context.read())))
      ], child: this);
}
