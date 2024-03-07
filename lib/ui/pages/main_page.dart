import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

class MainPage extends StatefulWidget with AutoRouteWrapper {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<DayBloc>(
            create: ((context) => DayBloc(daysRepository: context.read())))
      ], child: this);
}

class _MainPageState extends State<MainPage> {
  bool isFromNotification = false;

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('Title: ${message.notification?.title}');
  }

  Future<void> handleMessage(RemoteMessage? message) async {
    if (message == null) return;
    isFromNotification = true;

    bool isAuthenticated = await context.read<AuthCubit>().check();
    if (isAuthenticated) {
      context.pushRoute(SetDayEmojiRoute(isFirstTime: true));
    } else {
      context.pushRoute(LoginRoute());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final tagsCubit = context.read<TagsCubit>();
    final ragingCubit = context.read<RatingCubitCubit>();
    return BlocListener<DayBloc, DayState>(
      listener: (context, dayState) {
        if (dayState is ErrorUnauthGetDayState) {
          _replacePage(context, LoginRoute());
        }
      },
      child: BlocListener<AuthCubit, AuthState>(
        listener: ((context, state) {
          try {
            if (state is AuthenticatedState) {
              context.read<DayBloc>().getDay(
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
              if (state is EmptyGetDayState || isFromNotification) {
                _replacePage(context, SetDayEmojiRoute(isFirstTime: true));
              } else if (state is ResultGetDayState) {
                _replacePage(context, ContainerRoute());
              } else if (state is ErrorUnauthGetDayState ||
                  state is ErrorGetDayState) {
                _replacePage(context, LoginRoute());
              }
            },
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }

  Future<void> _replacePage(
      BuildContext context, PageRouteInfo routeInfo) async {
    //context.router.popUntilRoot();
    await context.router.push(routeInfo);
  }
}
