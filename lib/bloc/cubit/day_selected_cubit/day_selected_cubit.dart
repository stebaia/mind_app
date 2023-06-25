import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mind_app/model/day.dart';

part 'day_selected_state.dart';

class DaySelectedCubit extends Cubit<DaySelectedState> {
  DaySelectedCubit() : super(UnselectedDay());

  void changeValue(Day? value){
    if(value != null) {
      emit(DaySelectedInitial(day: value));
    }else {
      emit(UnselectedDay());
    }
  } 

}



