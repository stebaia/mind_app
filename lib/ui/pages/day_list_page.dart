import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:mind_app/bloc/cubit/day_selected_cubit/day_selected_cubit.dart';
import 'package:mind_app/bloc/cubit/rating_cubit/rating_cubit_cubit.dart';
import 'package:mind_app/bloc/day_bloc/day_bloc.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/ui/components/buttons.dart';
import 'package:mind_app/ui/components/date_element_widget.dart';
import 'package:mind_app/ui/components/emoji_text.dart';
import 'package:mind_app/ui/components/widget_detail_mood.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/theme_helper.dart';
import 'package:table_calendar/table_calendar.dart';

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
  late final ValueNotifier<Day> _selectedEvents;
  String selectedDate = DateConverter.getDateNowWithFormatSimples();
  int selectedIndex = -1;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void dispose() {
    super.dispose();
  }

  Day? getInformationOfDaySelected(DateTime date, List<Day> days) {
    Day? myDay;
    for (var day in days) {
      DateTime dayDate = DateTime.parse(day.day);

      if (isSameDay(dayDate, date)) {
        myDay = day;
      }
    }
    return myDay;
  }

  List<dynamic> getEvents(DateTime date, List<Day> days) {
    List<dynamic> events = [];

    for (var day in days) {
      DateTime dayDate = DateTime.parse(day.day);

      if (isSameDay(dayDate, date)) {
        events.add(day);
      }
    }

    return events;
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  /*List<dynamic> Function(DateTime) _loadEvents(List<Day> days) {
    // Esegue la conversione da List<Day> a List<dynamic> in base alla data
    final kEvents = LinkedHashMap<DateTime, List<Day>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);
    /*return (DateTime dateTime) {
      List<dynamic> events = [];
      for (var day in days) {
        print(DateTime.parse(day.day));
        print(dateTime);
        if(isSameDay(DateTime.parse(day.day), dateTime)){
          events.add(DateTime.parse(day.day));
        }
        
      }
      return events;
    };*/
    return kEvents;
    // Trova gli eventi corrispondenti alla data fornita
  }*/

  @override
  Widget build(BuildContext context) {
    final myNewDay = context.read<DaySelectedCubit>();
    final sliderValue = context.read<RatingCubitCubit>();
    return WillPopScope(
      onWillPop: () async {
        context.read<DaySelectedCubit>().changeValue(null);
        return true;
      },
      child: Scaffold(
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
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'PoppinsExtrabold'),
                          ),
                        ],
                      ),
                    ]),
              ),
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
                        /*Align(
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
                        ),*/
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
                          //print(DateTime.now());

                          if (state is ResultGetDayState) {
                            List<Day> days = state.daysList.days!;
                            if (_selectedDay == null) {
                              myNewDay.changeValue(days.last);
                            } else {
                              try {
                                Day? valueDay = state.daysList.days!
                                    .where((element) => isSameDay(
                                        DateTime.parse(element.day),
                                        _selectedDay))
                                    .first;
                                myNewDay.changeValue(valueDay);
                              } catch (ex) {
                                myNewDay.changeValue(null);
                              }
                            }

                            return Column(
                              children: [
                                TableCalendar(
                                  eventLoader: (date) => getEvents(date, days),
                                  calendarBuilders: CalendarBuilders(
                                    markerBuilder: (context, day, events) {
                                      if (events.isEmpty) return SizedBox();

                                      return ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: events.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                margin: const EdgeInsets.only(
                                                    top: 30),
                                                padding:
                                                    const EdgeInsets.all(1),
                                                child: Container(
                                                  // height: 7, // for vertical axis
                                                  width:
                                                      10, //for horizontal axis
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: DateConverter
                                                        .getEventColor(
                                                            (events[index]
                                                                    as Day)
                                                                .mood),
                                                  ),
                                                ));
                                          });
                                    },
                                  ),
                                  selectedDayPredicate: (day) {
                                    // Use `selectedDayPredicate` to determine which day is currently selected.
                                    // If this returns true, then `day` will be marked as selected.

                                    // Using `isSameDay` is recommended to disregard
                                    // the time-part of compared DateTime objects.

                                    //myNewDay = days.last;

                                    return isSameDay(_selectedDay, day);
                                  },
                                  onDaySelected: (selectedDay, focusedDay) {
                                    if (!isSameDay(_selectedDay, selectedDay)) {
                                      Day? thisDay =
                                          getInformationOfDaySelected(
                                              selectedDay, days);
                                      if (thisDay != null) {
                                        myNewDay.changeValue(thisDay);
                                      } else {
                                        myNewDay.changeValue(null);
                                      }

                                      // Call `setState()` when updating the selected day
                                      setState(() {
                                        _selectedDay = selectedDay;
                                        _focusedDay = focusedDay;
                                      });
                                    }
                                  },
                                  onFormatChanged: (format) {
                                    if (_calendarFormat != format) {
                                      // Call `setState()` when updating calendar format
                                      setState(() {
                                        _calendarFormat = format;
                                      });
                                    }
                                  },
                                  onPageChanged: (focusedDay) {
                                    // No need to call `setState()` here
                                    _focusedDay = focusedDay;
                                  },
                                  firstDay: DateTime.utc(2023, 01, 01),
                                  lastDay: DateTime.utc(2100, 01, 01),
                                  focusedDay: _focusedDay,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                BlocBuilder<DaySelectedCubit, DaySelectedState>(
                                  builder: (context, state) {
                                    if (state is UnselectedDay) {
                                      return Container(
                                          padding: const EdgeInsets.only(
                                              bottom: 20, right: 20, left: 20),
                                          alignment: Alignment.bottomRight,
                                          child: FunctionButton(
                                            colorText: Colors.white,
                                            colorsBackground: ThemeHelper
                                                .buttonSecondaryColor,
                                            text: 'Send!',
                                            onPressed: () {
                                              context
                                                  .pushRoute(SetDayRoute(
                                                      isFirstTime: false,
                                                      passedDay: Day(
                                                          day: DateConverter
                                                              .getDateNowWithFormatSimpleWithParameter(
                                                                  _selectedDay
                                                                      .toString()),
                                                          mood: 3)))
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
                                                  );
                                            },
                                          ));
                                    } else if (state is DaySelectedInitial) {
                                      return GestureDetector(
                                        onTap: () => context
                                            .pushRoute(SetDayRoute(
                                                isFirstTime: false,
                                                passedDay: state.day))
                                            .then(
                                          (value) {
                                            context.read<DayBloc>().getDay(
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
                                                    .getDateNowWithFormatSimples());
                                          },
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              color: ThemeHelper.colorSemiWhite,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(children: [
                                                Container(
                                                  width: 10,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: DateConverter
                                                        .getEventColor(
                                                            state.day!.mood),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              DateConverter.getDateString(
                                                                      state.day!
                                                                          .day)
                                                                  .capitalize(),
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            EmojyTextWidget(
                                                              mood: state
                                                                  .day!.mood,
                                                              size: 20,
                                                            )
                                                          ],
                                                        ),
                                                        state.day!.mood != null
                                                            ? state.day!.note!
                                                                        .length >
                                                                    30
                                                                ? Text(state
                                                                    .day!.note!
                                                                    .substring(
                                                                        0, 50))
                                                                : Text(state
                                                                    .day!.note!)
                                                            : Container()
                                                      ]),
                                                )
                                              ]),
                                              Icon(
                                                CupertinoIcons.chevron_right,
                                                color: ThemeHelper.buttonColor,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                              ],
                            );

                            /*return Column(
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
                            */
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
      ),
    );
  }
}
