import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mind_app/model/day.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarInitial> {
  CalendarCubit() : super(CalendarInitial(day: null));
  void changeDay(Day newDay) => emit(CalendarInitial(day: newDay));
}
