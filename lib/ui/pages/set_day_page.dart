import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:mind_app/bloc/cubit/rating_cubit/rating_cubit_cubit.dart';
import 'package:mind_app/bloc/day_bloc/day_bloc.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/ui/components/face_feedback.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/theme_helper.dart';

class SetDayPage extends StatelessWidget with AutoRouteWrapper {
  const SetDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderValue = context.read<RatingCubitCubit>();
    final user = context.read<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: [
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
              BlocConsumer<DayBloc, DayState>(
                listener: (context, state) {
                  if(state is ResultSetDayState){
                    context.pushRoute(CoreRoute());
                  }else if(state is ErrorSetDayState){
                    Fluttertoast.showToast(msg: "error, please retry later!");
                  }
                },
                builder: (context, state) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: SingleChildScrollView(
                          child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'How was your day today?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'PoppinsExtraBold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                          color: ThemeHelper.buttonSecondaryColor),
                                    ),
                                  ),
                                  Text(
                                    'Was your day good or bad? do you want to let off some steam?',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: BlocBuilder<RatingCubitCubit,
                                        RatingCubitInitial>(
                                      builder: (context, state) =>
                                          faceFeedback(state.value.toInt()),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: BlocBuilder<RatingCubitCubit,
                                            RatingCubitInitial>(
                                        builder: ((context, state) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width / 1.4,
                                        child: Slider(
                                          activeColor: ThemeHelper.buttonColor,
                                          value: state.value,
                                          max: 100,
                                          divisions: 4,
                                          onChanged: (double value) {
                                            BlocProvider.of<RatingCubitCubit>(
                                                    context)
                                                .changeValue(value);
                                          },
                                        ),
                                      );
                                    })),
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: TextField(
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 14),
                                          hintText: 'What\'s going on?',
                                          filled: true,
                                          fillColor:
                                              ThemeHelper.backgroundColorWhite,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          )),
                                      maxLines: 300 ~/ 20,
                                      keyboardType: TextInputType.multiline,
                                    ),
                                  ),
                                ],
                              )),
                        ))
                      ]);
                },
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 100, right: 20),
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ThemeHelper.buttonColor,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: TextButton.icon(
                        icon: Icon(
                          Icons.face_sharp,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Confirm!',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PoppinsExtraBold',
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: (() {
                          context.read<DayBloc>().setDay(userId: (user.state as AuthenticatedState).user.id, day: DateConverter.getDateNowWithFormatSimples(), mood: 5, note: "ciaoo", tags: ["prova"], timestamp: DateConverter.getDateNowWithFormatSimples());
                        })),
                  ))
            ]));
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<DayBloc>(
            create: ((context) => DayBloc(daysRepository: context.read())))
      ], child: this);
}
