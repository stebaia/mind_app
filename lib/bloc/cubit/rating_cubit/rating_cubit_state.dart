part of 'rating_cubit_cubit.dart';

@immutable
abstract class RatingCubitState {}

class RatingCubitInitial extends RatingCubitState {
  double value;
  RatingCubitInitial({required this.value});
}
