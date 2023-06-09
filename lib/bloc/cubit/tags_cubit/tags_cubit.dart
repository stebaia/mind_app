import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tags_state.dart';

class TagsCubit extends Cubit<List<String>> {
  TagsCubit() : super([]);

  void updateText(String value) {
    emit([...state, value]);
  }

  void deleteAll(){
    emit([]);
  }

  void addString(String element) {
   List<String> newState = List.from(state)..add(element);
   emit(newState);
  }

  void updateArray(List<String> list) {
  
    emit(list);
  }
}
