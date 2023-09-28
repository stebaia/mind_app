import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';




class TextFieldCubit extends Cubit<String> {
  TextFieldCubit(String initialValue) : super(initialValue);

  void updateText(String newText) {
    emit(newText);
  }
}
