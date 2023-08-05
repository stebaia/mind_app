import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_app/bloc/cubit/rating_cubit/rating_cubit_cubit.dart';
import 'package:mind_app/bloc/cubit/visibility_cubit/visibility_cubit.dart';
import 'package:mind_app/bloc/day_bloc/day_bloc.dart';
import 'package:mind_app/ui/components/face_feedback.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/theme_helper.dart';

class SetDayEmojiPage extends StatefulWidget with AutoRouteWrapper {
  const SetDayEmojiPage({super.key});

  @override
  State<SetDayEmojiPage> createState() => _SetDayEmojiPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<DayBloc>(
            create: ((context) => DayBloc(daysRepository: context.read())))
      ], child: this);
}

class _SetDayEmojiPageState extends State<SetDayEmojiPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingCubitCubit, RatingCubitInitial>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                left: -100.0,
                top: -50.0,
                child: SvgPicture.asset(
                  'assets/blob.svg',
                  height: 260,
                ),
              ),
              Positioned(
                right: 0.0,
                top: 50.0,
                child: SvgPicture.asset(
                  'assets/blob.svg',
                  height: 150,
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: GestureDetector(
                  child: Padding(
                      padding: EdgeInsets.all(10), child: Icon(Icons.close)),
                ),
              ),
              BlocBuilder<VisibilityCubit, VisibilityCubitInitial>(
                builder: (context, visibilityState) {
                  if (visibilityState.isVisible) {
                    return Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 500,
                        child: Column(
                          children: [
                            Text(
                              'NEgroooooooo',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'PoppinsExtrabold'),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: BlocBuilder<RatingCubitCubit,
                                  RatingCubitInitial>(
                                builder: (context, state) {
                                  return faceFeedback(state.value.toInt());
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                child: Container(
                              width: MediaQuery.of(context).size.width / 1.4,
                              child: Slider(
                                activeColor: ThemeHelper.buttonColor,
                                value: state.value,
                                max: 5,
                                min: 1,
                                divisions: 4,
                                onChanged: (double value) {
                                  BlocProvider.of<RatingCubitCubit>(context)
                                      .changeValue(value);
                                },
                              ),
                            )),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.all(20),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.all(18),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: ThemeHelper
                                                .buttonSecondaryColor),
                                        child: Icon(
                                          CupertinoIcons.arrow_right,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 500,
                        child: Column(
                          children: [
                            Text(
                              'Hey! how was your day today?',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'PoppinsExtrabold'),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: BlocBuilder<RatingCubitCubit,
                                  RatingCubitInitial>(
                                builder: (context, state) {
                                  return faceFeedback(state.value.toInt());
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                child: Container(
                              width: MediaQuery.of(context).size.width / 1.4,
                              child: Slider(
                                activeColor: ThemeHelper.buttonColor,
                                value: state.value,
                                max: 5,
                                min: 1,
                                divisions: 4,
                                onChanged: (double value) {
                                  BlocProvider.of<RatingCubitCubit>(context)
                                      .changeValue(value);
                                },
                              ),
                            )),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.all(20),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.all(18),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: ThemeHelper
                                                .buttonSecondaryColor),
                                        child: Icon(
                                          CupertinoIcons.arrow_right,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
