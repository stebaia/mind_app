import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:mind_app/bloc/day_bloc/day_bloc.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/ui/components/emoji_text.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/theme_helper.dart';

class DayListPage extends StatelessWidget with AutoRouteWrapper {
  DayListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(CupertinoIcons.add),onPressed: () => context.pushRoute(SetDayRoute(isFirstTime: false),).then((value) => context.read<DayBloc>().getDay(
                  userId: ((context.read<AuthCubit>() as AuthCubit).state
                          as AuthenticatedState)
                      .user
                      .id,
                  dayFrom: DateConverter.getDateAll(),
                  dayTo: DateConverter.getDateNowWithFormatSimples()),)),
      backgroundColor: ThemeHelper.backgroundColorWhite,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            
            Container(
                width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  IconButton(
                      icon: Icon(
                        CupertinoIcons.arrow_left,
                      ),
                      onPressed: () => context.popRoute()),
                  const Text(
                    'Your emotional state',
                    style:
                        TextStyle(fontSize: 26, fontFamily: 'PoppinsExtrabold'),
                  ),
                ])),
            Container(
              padding: EdgeInsets.all(24),
              child: Column(children: [
                Text(
                  'This is the history of how you have been lately, check if everything is OK!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: ThemeHelper.buttonSecondaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        focusColor: Colors.white,
                        onChanged: (value) {},
                        value: 'All',
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          'All',
                          'Month',
                          'Week',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Please choose a langauage",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<DayBloc, DayState>(
                  builder: (context, state) {
                    if (state is ResultGetDayState) {
                      List<Day> days = state.daysList.days!;
                      return Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) => Divider(),
                          shrinkWrap: true,
                          itemCount: days.length,
                          itemBuilder: (context, index) => ListTile(
                            trailing: Icon(CupertinoIcons.chevron_right),
                            leading: EmojyTextWidget(mood: days[index].mood,),
                           
                            title: Text(
                              'Your mood was ${moodToString(days[index].mood)}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: days[index].note != null
                                ? Text(days[index].note!.length > 40
                                    ? '${days[index].note!.substring(0, 40)} - ${days[index].mood}'
                                    : '${days[index].note!} - ${days[index].day}')
                                : Container(),
                          ),
                        ),
                      );
                    } else if (state is TryGetDayState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: Text('No elements'),
                      );
                    }
                  },
                )
              ]),
            )
          ],
        ),
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
                  dayFrom: DateConverter.getDateAll(),
                  dayTo: DateConverter.getDateNowWithFormatSimples())))
      ], child: this);
}
