import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rating_cubit_state.dart';

class RatingCubitCubit extends Cubit<RatingCubitInitial> {
  RatingCubitCubit() : super(RatingCubitInitial(value: 50));

  void changeValue(double value) => emit(RatingCubitInitial(value: value));
}
