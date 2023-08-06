import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:mind_app/bloc/cubit/rating_cubit/rating_cubit_cubit.dart';
import 'package:mind_app/bloc/cubit/tags_cubit/tags_cubit.dart';
import 'package:mind_app/bloc/cubit/visibility_cubit/visibility_cubit.dart';
import 'package:mind_app/bloc/day_bloc/day_bloc.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/ui/components/buttons.dart';
import 'package:mind_app/ui/components/face_feedback.dart';
import 'package:mind_app/ui/components/tags_widget.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/theme_helper.dart';

class SetDayEmojiPage extends StatelessWidget with AutoRouteWrapper {
  const SetDayEmojiPage({super.key, this.passedDay, required this.isFirstTime});
  final Day? passedDay;
  final bool isFirstTime;
  @override
  Widget build(BuildContext context) {
    if (passedDay != null) {
      context.read<RatingCubitCubit>().changeValue(passedDay!.mood.toDouble());
    }

    final sliderValue = context.read<RatingCubitCubit>();
    final user = context.read<AuthCubit>();
    final tagsCubit = context.read<TagsCubit>();

    TextEditingController controller =
        TextEditingController(text: passedDay != null ? passedDay!.note : '');

    return BlocConsumer<DayBloc, DayState>(
                  listener: (context, state) {
                    if (state is ResultSetDayState) {
                      isFirstTime ? 
                              context.pushRoute(CoreRoute()) : context.popRoute();
                      
                    } else if (state is ErrorSetDayState) {
                      Fluttertoast.showToast(msg: "error, please retry later!");
                    }
                  },
      builder: (context, setDayState) {
        return BlocBuilder<RatingCubitCubit, RatingCubitInitial>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Stack(
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
                        onTap: (){
                          context.read<TagsCubit>().deleteAll();
                          if(isFirstTime){
                            
                                    context.pushRoute(CoreRoute());
                          }else {
                            context.popRoute();
                          }       
                          
                        },
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.close)),
                      ),
                    ),
                    BlocBuilder<VisibilityCubit, VisibilityCubitInitial>(
                      builder: (context, visibilityState) {
                        if (visibilityState.isVisible) {
                          return Center(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                  ),
                                  const Text(
                                    'Describe what is happened',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'PoppinsExtrabold'),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: TextField(
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      controller: controller,
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 14),
                                          hintText: 'What\'s going on?',
                                          filled: true,
                                          fillColor:
                                              ThemeHelper.backgroundColorWhite,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          )),
                                      maxLines: 200 ~/ 20,
                                      keyboardType: TextInputType.multiline,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TagsWidget(),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    padding: EdgeInsets.all(20),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () => BlocProvider.of<
                                                    VisibilityCubit>(context)
                                                .changeVisibility(false),
                                            child: Container(
                                              padding: EdgeInsets.all(18),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: ThemeHelper
                                                      .buttonSecondaryColor),
                                              child: Icon(
                                                CupertinoIcons.arrow_left,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.read<DayBloc>().setDay(
                                                  userId: (user.state
                                                          as AuthenticatedState)
                                                      .user
                                                      .id,
                                                  day: !isFirstTime
                                                      ? DateConverter
                                                          .getDateNowWithFormatSimpleWithParameter(
                                                              passedDay!.day)
                                                      : DateConverter
                                                          .getDateNowWithFormatSimples(),
                                                  mood:
                                                      (sliderValue.state.value)
                                                          .round(),
                                                  note: controller.text,
                                                  tags: tagsCubit.state
                                                      .map((string) =>
                                                          string.toLowerCase())
                                                      .toList(),
                                                  timestamp: DateConverter
                                                      .getDateNowWithFormatSimples());
                                              context
                                                  .read<TagsCubit>()
                                                  .deleteAll();

                                              
                                            },
                                            child:  Container(
                                              padding: EdgeInsets.all(18),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: ThemeHelper
                                                      .buttonSecondaryColor),
                                              child: setDayState is TrySetDayState ? Center(child: Container(height: 24, child: CircularProgressIndicator()),) : Text(
                                                'Send',
                                                style: TextStyle(
                                                    color: Colors.white),
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
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 120,
                                  ),
                                  Text(
                                    'Hey! how was your day today?',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'PoppinsExtrabold'),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: BlocBuilder<RatingCubitCubit,
                                        RatingCubitInitial>(
                                      builder: (context, state) {
                                        return faceFeedback(
                                            state.value.toInt());
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                      child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: Slider(
                                      activeColor: ThemeHelper.buttonColor,
                                      value: state.value,
                                      max: 5,
                                      min: 1,
                                      divisions: 4,
                                      onChanged: (double value) {
                                        BlocProvider.of<RatingCubitCubit>(
                                                context)
                                            .changeValue(value);
                                      },
                                    ),
                                  )),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        BlocProvider.of<VisibilityCubit>(
                                                context)
                                            .changeVisibility(true),
                                    child: Container(
                                      padding: EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color:
                                              ThemeHelper.buttonSecondaryColor),
                                      child: Icon(
                                        CupertinoIcons.arrow_right,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<DayBloc>(
            create: ((context) => DayBloc(daysRepository: context.read())))
      ], child: this);
}
