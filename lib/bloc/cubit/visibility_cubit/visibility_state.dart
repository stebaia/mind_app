part of 'visibility_cubit.dart';

@immutable
abstract class VisibilityCubitState {}

class VisibilityCubitInitial extends VisibilityCubitState {
  bool isVisible;
  VisibilityCubitInitial({required this.isVisible});
}
