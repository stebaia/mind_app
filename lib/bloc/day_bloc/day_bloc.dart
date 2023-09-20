import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mind_app/model/day_list.dart';
import 'package:mind_app/model/day_result.dart';
import 'package:mind_app/repositories/days_repository.dart';

part 'day_event.dart';
part 'day_state.dart';

class DayBloc extends Bloc<DayEvent, DayState> {

  final DaysRepository daysRepository;

  DayBloc({
    required this.daysRepository
  }) : super(TryGetDayState()) {
    on<GetDayEvent>(_getDay);
    on<SetDayEvent>(_setDay);
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


  void setDay({
    required String userId,
    required String day,
    required int mood,
    required String note,
    required List<String> tags,
    required String timestamp
  }){
    add(SetDayEvent(userId: userId, day: day, mood: mood, note: note, tags: tags, timestamp: timestamp));
  }

  FutureOr<void> _getDay(
      GetDayEvent event, Emitter<DayState> emitter) async {
    emit(const TryGetDayState());
    try {
      final dayList = await daysRepository.getDay(userId: event.userId, dayFrom: event.dayFrom, dayTo: event.dayTo);
      if(dayList.count > 0){
        emit(ResultGetDayState(dayList));
      }else{
        emit(EmptyGetDayState());
      }
      
    } catch (e) {
      if(e is DioError){
        if(e.response?.statusCode == 401){
          emit(const ErrorUnauthGetDayState());
        }else {
          emit(const ErrorGetDayState());
        }
        
      }else{
        emit(const ErrorGetDayState());
      }
      
    }
  }

  FutureOr<void> _setDay(
      SetDayEvent event, Emitter<DayState> emitter) async {
    emit(const TrySetDayState());
    try {
      final dayResult = await daysRepository.setDay(userId: event.userId, day: event.day, mood: event.mood, note: event.note, tags: event.tags, timestamp: event.timestamp);
      emit(ResultSetDayState(dayResult));
     } catch (e) {
      if(e is DioError){
        if(e.response?.statusCode == '401'){
          emit(const ErrorUnauthSetDayState());
        }else {
          emit(const ErrorSetDayState());
        }
        
      }else{
        emit(const ErrorSetDayState());
      }
      
    }
  }
}
