import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:mind_app/bloc/day_bloc/day_bloc.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/ui/components/date_element_widget.dart';
import 'package:mind_app/ui/components/emoji_text.dart';
import 'package:mind_app/ui/components/widget_detail_mood.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/theme_helper.dart';

class DayListPage extends StatefulWidget with AutoRouteWrapper {
  DayListPage({super.key});

  @override
  State<DayListPage> createState() => _DayListPageState();

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

class _DayListPageState extends State<DayListPage> {
  String selectedDate = DateConverter.getDateNowWithFormatSimples();
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                    children: [
                      IconButton(
                      icon: Icon(
                        CupertinoIcons.arrow_left,
                      ),
                      onPressed: () => context.popRoute()),
                  const Text(
                    'Your emotional state',
                    style:
                        TextStyle(fontSize: 20, fontFamily: 'PoppinsExtrabold'),
                  ),
                    ],
                  ),
                  
                   IconButton(
                      icon: Icon(
                        CupertinoIcons.add_circled,
                        color: ThemeHelper.buttonColor,
                      ),
                      onPressed: () => context.pushRoute(
                SetDayRoute(isFirstTime: false),
              )
              .then(
                (value) => context.read<DayBloc>().getDay(
                    userId: ((context.read<AuthCubit>() as AuthCubit).state
                            as AuthenticatedState)
                        .user
                        .id,
                    dayFrom: DateConverter.getDateAll(),
                    dayTo: DateConverter.getDateNowWithFormatSimples()),
              )),
                ])),
            Container(
              child: Column(
                children: [
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
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          
                          width: 200,
                          padding: EdgeInsets.symmetric(horizontal: 30),
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
                    ]),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    
                    child: BlocBuilder<DayBloc, DayState>(
                      builder: (context, state) {
                        if (state is ResultGetDayState) {
                          List<Day> days = state.daysList.days!;
  
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(alignment: Alignment.center,child: Text(DateConverter.getMonthByDate(selectedIndex > -1 ?  days[selectedIndex].day : days.last.day),style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
                              SizedBox(height: 20,),
                              SizedBox(
                                height: 180,
                                child: 
                                    ListView.builder(
                                        
                                        shrinkWrap: false,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: days.length,
                                        itemBuilder: (context, index) {
                              
                                          bool isCurrentDate =
                                              days[index].day == selectedDate;
                                          bool isSelected = index == selectedIndex;
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {                                               
                                                selectedIndex = index;
                                                selectedDate = '';
                                              });
                                            },
                                            child: Align(
                                                alignment: Alignment.topCenter,
                                                child: isCurrentDate
                                                    ? DateSelectedElementWidget(
                                                        day: days[index],
                                                      )
                                                    : (isSelected
                                                        ? DateSelectedElementWidget(
                                                            day: days[index],
                                                          )
                                                        : DateUnSelectedElementWidget(
                                                            day: days[index]))),
                                          );
                                        }),
                                     
                                     
                              ),
                              MoodDetailWidget(day: selectedIndex > -1 ?  days[selectedIndex] : days.last)
                            ],
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
                    ),
                  ),
                  

                  /*BlocBuilder<DayBloc, DayState>(
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
                                  onTap: () => context.pushRoute(DetailMoodRoute(day: days[index])),
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
                      ),*/
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
