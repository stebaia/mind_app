import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mind_app/model/day_list.dart';
import 'package:mind_app/repositories/days_repository.dart';

part 'day_event.dart';
part 'day_state.dart';

class DayBloc extends Bloc<DayEvent, GetDayState> {

  final DaysRepository daysRepository;

  DayBloc({
    required this.daysRepository
  }) : super(TryGetDayState()) {
    on<GetDayEvent>(_getDay);
  }

   void getDay({
    required String userId,
    required String dayFrom,
    required String dayTo
  }) =>
      add(GetDayEvent(
        userId: userId,
        dayFrom: dayFrom,
        dayTo: dayTo
      ));


  FutureOr<void> _getDay(
      GetDayEvent event, Emitter<GetDayState> emitter) async {
    emit(const TryGetDayState());
    try {
      final dayList = await daysRepository.getDay(userId: event.userId, dayFrom: event.dayFrom, dayTo: event.dayTo);
      if(dayList.count > 0){
        emit(ResultGetDayState(dayList));
      }else{
        emit(EmptyGetDayState());
      }
      
    } catch (e) {
      emit(const ErrorGetDayState());
    }
  }
}
