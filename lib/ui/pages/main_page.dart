import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/utils/theme_helper.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => BlocListener<AuthCubit, AuthState>(
        listener: ((context, state) {
          try {
            if (state is AuthenticatedState) {
              _replacePage(context, const CoreRoute());
            } else if (state is NotAuthenticatedState) {
              _replacePage(context, const LoginRoute());
            }
          } catch (e) {
            _replacePage(context, LoginRoute());
          }
        }),
        child: const Scaffold(
          backgroundColor: ThemeHelper.backgroundColorWhite,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );

  Future<void> _replacePage(
      BuildContext context, PageRouteInfo routeInfo) async {
    //context.router.popUntilRoot();
    await context.router.push(routeInfo);
  }
}
