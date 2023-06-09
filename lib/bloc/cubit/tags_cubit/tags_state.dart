part of 'tags_cubit.dart';

@immutable
abstract class TagsState {}

class TagsStateInital extends TagsState {
  List<String> tags;
  TagsStateInital({required this.tags});
}
