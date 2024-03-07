import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mind_app/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_app/bloc/day_bloc/day_bloc.dart';
import 'package:mind_app/providers/dark_theme_provider.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/ui/components/carousel_item.dart';
import 'package:mind_app/ui/components/line_chart.dart';
import 'package:mind_app/ui/components/text_feeling_widget.dart';
import 'package:mind_app/ui/pages/secret_note_detail_page.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/auth_service.dart';
import 'package:mind_app/utils/theme_helper.dart';
import 'package:provider/provider.dart';

class CorePage extends StatelessWidget with AutoRouteWrapper {
  const CorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          darkMode.darkTheme ? ThemeHelper.backgroundColorDark : Colors.white,
      /*appBar: AppBar(
        title: Text(AppLocalizations.of(context).app_name),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            context.read<AuthCubit>().manualLogout();
          },
        ),
      ),*/
      body: SingleChildScrollView(child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthenticatedState) {
            return SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1.2,
                child: Stack(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hi ${state.user.name}',
                                          style: const TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        BlocBuilder<DayBloc, DayState>(
                                          builder: (context, state) {
                                            if (state is ResultGetDayState) {
                                              return TextFeelingWidget(
                                                mood: state
                                                    .daysList.days!.last.mood,
                                                color: darkMode.darkTheme
                                                    ? Colors.white
                                                    : Colors.black,
                                              );
                                            } else {
                                              return GestureDetector(
                                                onTap: () =>
                                                    context
                                                        .pushRoute(
                                                            SetDayEmojiRoute(
                                                                isFirstTime:
                                                                    true))
                                                        .then(
                                                          (value) => context.read<DayBloc>().getDay(
                                                              userId: ((context.read<AuthCubit>()
                                                                              as AuthCubit)
                                                                          .state
                                                                      as AuthenticatedState)
                                                                  .user
                                                                  .id,
                                                              dayFrom: DateConverter
                                                                  .getDateAll(),
                                                              dayTo: DateConverter
                                                                  .getDateNowWithFormatSimples()),
                                                        ),
                                                child: Text(
                                                    'Tell me how you are today!',
                                                    style: TextStyle(
                                                        color: Colors.black)),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: GestureDetector(
                                      onTap: () {
                                        context
                                            .pushRoute(SecretNoteDetailRoute());
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: darkMode.darkTheme
                                              ? CupertinoColors.black
                                              : Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                      255, 129, 121, 129)
                                                  .withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: 36,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                    color: ThemeHelper
                                                        .secondaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                                child: const Center(
                                                    child: Icon(
                                                  CupertinoIcons.lock_circle,
                                                  color:
                                                      ThemeHelper.buttonColor,
                                                ))),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Secret note',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: darkMode.darkTheme
                                                      ? CupertinoColors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 14),
                                            ),
                                            const Text(
                                              'let the anger go..',
                                              style: TextStyle(fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(10),
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: darkMode.darkTheme
                                            ? CupertinoColors.black
                                            : Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 129, 121, 129)
                                                .withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 36,
                                              height: 36,
                                              decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              child: const Center(
                                                  child: Icon(
                                                CupertinoIcons.lock_circle,
                                                color: ThemeHelper.buttonColor,
                                              ))),
                                          const SizedBox(height: 10),
                                          Text(
                                            'Community',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: darkMode.darkTheme
                                                    ? CupertinoColors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 14),
                                          ),
                                          const Text(
                                            'community center',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'How was your week?',
                                      style: TextStyle(
                                          color: darkMode.darkTheme
                                              ? CupertinoColors.white
                                              : Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () => context
                                          .pushRoute(DayListRoute())
                                          .then(
                                            (value) => context.read<DayBloc>().getDayTo(
                                                userId: ((context.read<
                                                                    AuthCubit>()
                                                                as AuthCubit)
                                                            .state
                                                        as AuthenticatedState)
                                                    .user
                                                    .id,
                                                dayFrom:
                                                    DateConverter.getDateAll(),
                                                dayTo: DateConverter
                                                    .getDateNowWithFormatSimples()),
                                          ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Show calendar...',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                              color: darkMode.darkTheme
                                                  ? ThemeHelper.secondaryColor
                                                  : ThemeHelper
                                                      .buttonSecondaryColor,
                                            ),
                                          ),
                                          const Icon(
                                            CupertinoIcons.chevron_right,
                                            size: 18,
                                            color: ThemeHelper.buttonColor,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                BlocBuilder<DayBloc, DayState>(
                                  builder: (context, state) {
                                    if (state is ResultGetDayState) {
                                      return Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: darkMode.darkTheme
                                                ? CupertinoColors.black
                                                : Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        255, 129, 121, 129)
                                                    .withOpacity(0.2),
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: LineChartSample2(
                                            days: state.daysList.days,
                                          ));
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'News for your well-being',
                                      style: TextStyle(
                                          color: darkMode.darkTheme
                                              ? CupertinoColors.white
                                              : Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'See all..',
                                          style: TextStyle(
                                            color: darkMode.darkTheme
                                                ? ThemeHelper.secondaryColor
                                                : ThemeHelper
                                                    .buttonSecondaryColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.chevron_right,
                                          size: 18,
                                          color: ThemeHelper.buttonColor,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 0),
                              child: const CarouselItem())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Container(
                  width: 30, height: 30, child: CircularProgressIndicator()),
            );
          }
        },
      )),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<DayBloc>(
            create: ((context) => DayBloc(daysRepository: context.read())
              ..getDayTo(
                  userId: ((context.read<AuthCubit>() as AuthCubit).state
                          as AuthenticatedState)
                      .user
                      .id,
                  dayFrom: DateConverter.getDateSevenDaysAgo(),
                  dayTo: DateConverter.getDateNowWithFormatSimples())))
      ], child: this);
}
