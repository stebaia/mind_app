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
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/ui/components/carousel_item.dart';
import 'package:mind_app/ui/components/example_chart.dart';
import 'package:mind_app/ui/components/line_chart.dart';
import 'package:mind_app/ui/pages/secret_note_detail_page.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/auth_service.dart';
import 'package:mind_app/utils/theme_helper.dart';

class CorePage extends StatelessWidget with AutoRouteWrapper {
  const CorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColorWhite,
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
                height: MediaQuery.of(context).size.height * 1.3,
                child: Stack(
                  children: [
                    Positioned(
                      left: -140.0,
                      top: -200.0,
                      child: SvgPicture.asset(
                        'assets/blob.svg',
                        width: 500,
                      ),
                    ),
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
                                              fontSize: 26,
                                              fontFamily: 'PoppinsExtrabold'),
                                        ),
                                        RichText(
                                            text: const TextSpan(
                                                text: 'You seem to be ',
                                                style: TextStyle(
                                                    color: Colors.black),
                                                children: [
                                              TextSpan(
                                                  text: 'angry',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                              TextSpan(
                                                  text: ' today!',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                            ])),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          context.pushRoute(ProfileRoute()),
                                      child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                              color: ThemeHelper.drawingColor,
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: const Center(
                                              child: Icon(
                                            CupertinoIcons.person_circle,
                                            color: Colors.black,
                                          ))),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 120,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Let offsome steam...',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        bool _localAuthentication =
                                            await AuthService
                                                .authenticateUser();
                                        if (_localAuthentication) {
                                          context
                                              .pushRoute(SecretNoteListRoute());
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Auth failed!");
                                        }
                                      },
                                      child: Row(
                                        children: const [
                                          Text(
                                            'See all...',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w900,
                                                color: ThemeHelper
                                                    .buttonSecondaryColor),
                                          ),
                                          Icon(
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
                                  height: 20,
                                ),
                                GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ThemeHelper.backgroundColorWhite,
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(255, 220, 199, 216)
                                                  .withOpacity(0.2),
                                          spreadRadius: 10,
                                          blurRadius: 10,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
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
                                              SizedBox(width: 10),
                                              const Text(
                                                'Add a secret note!',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 16),
                                              ),
                                            ]),
                                            const Text(
                                                'Feel like venting?\nWrite an ephemeral note and let the anger go..',
                                                style: TextStyle(fontSize: 13))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    context.pushRoute(SecretNoteDetailRoute());
                                  },
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'How was your week?',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () => context.pushRoute(DayListRoute()),
                                      child: const Row(
                                        children: [
                                          Text(
                                            'Check details...',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w900,
                                                color: ThemeHelper
                                                    .buttonSecondaryColor),
                                          ),
                                          Icon(
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
                                  height: 20,
                                ),
                                BlocBuilder<DayBloc, DayState>(
                                  builder: (context, state) {
                                    if (state is ResultGetDayState) {
                                      return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ThemeHelper
                                                  .backgroundColorWhite,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(
                                                          255, 220, 199, 216)
                                                      .withOpacity(0.2),
                                                  spreadRadius: 10,
                                                  blurRadius: 10,
                                                  offset: const Offset(0,
                                                      3), // changes position of shadow
                                                )
                                              ]),
                                          child: LineChartSample2(
                                            days: state.daysList.days,
                                          ));
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text(
                                      'News for your well-being',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children:  [
                                        Text(
                                          'See all..',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                              color: ThemeHelper
                                                  .buttonSecondaryColor),
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
              ..getDay(
                  userId: ((context.read<AuthCubit>() as AuthCubit).state
                          as AuthenticatedState)
                      .user
                      .id,
                  dayFrom: DateConverter.getDateSevenDaysAgo(),
                  dayTo: DateConverter.getDateNowWithFormatSimples())))
      ], child: this);
}
