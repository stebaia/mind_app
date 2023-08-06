import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'visibility_state.dart';

class VisibilityCubit extends Cubit<VisibilityCubitInitial> {
  VisibilityCubit() : super(VisibilityCubitInitial(isVisible: false));

  void changeVisibility(bool visibility) => emit(VisibilityCubitInitial(isVisible: visibility));
}
