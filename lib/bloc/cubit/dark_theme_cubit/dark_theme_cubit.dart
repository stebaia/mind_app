import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mind_app/utils/theme_helper.dart';

part 'dark_theme_state.dart';


enum DarkThemeMode { light, dark }


class DarkThemeCubit extends Cubit<DarkThemeMode> {
  final DarkThemePreferences _darkThemePreferences = DarkThemePreferences();

  DarkThemeCubit() : super(DarkThemeMode.light);

  Future<void> loadTheme() async {
    final isDark = await _darkThemePreferences.getTheme();
    emit(isDark ? DarkThemeMode.dark : DarkThemeMode.light);
  }

  void toggleTheme() async {
    emit(state == DarkThemeMode.light ? DarkThemeMode.dark : DarkThemeMode.light);
    await _darkThemePreferences.setDarkTheme(state == DarkThemeMode.dark);
  }

  void switchTheme(bool value) async {
    if(value){
      emit(DarkThemeMode.dark);
    }else {
      emit(DarkThemeMode.light);
    }
    await _darkThemePreferences.setDarkTheme(value);
  }

}
