import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mind_app/model/secret_note_model.dart';
import 'package:mind_app/repositories/secret_note_repository.dart';

part 'secret_note_event.dart';
part 'secret_note_state.dart';

class SecretNoteBloc extends Bloc<SecretNoteEvent, SecretNoteState> {
  final SecretNoteRepository secretNoteRepository;

  SecretNoteBloc({required this.secretNoteRepository})
      : super(const LoadingSecretNoteState()) {
    on<GetSecretNoteList>(_getSecretNoteList);
    on<InsertSecretNote>(_insertSecretNote);
  }

  void getSecretNoteList() => add(GetSecretNoteList());
  void insertSecretNote(
          {required String title,
          required String content,
          required String datetime}) =>
      add(InsertSecretNote(title: title, content: content, datetime: datetime));

  FutureOr<void> _getSecretNoteList(
      GetSecretNoteList event, Emitter<SecretNoteState> emitter) async {
    emit(const LoadingSecretNoteState());
    try {
      final secretNoteList = await secretNoteRepository.getAllSecretNotes();
      if (secretNoteList.isNotEmpty) {
        emit(FetchedListSecretNoteState(secretNoteList));
      } else {
        emit(EmptySecretNoteState());
      }
    } catch (e) {
      emit(ErrorSecretNoteState());
    }
  }

  FutureOr<void> _insertSecretNote(
      InsertSecretNote event, Emitter<SecretNoteState> emitter) async {
    emit(const LoadingSecretNoteState());
    try {
      final secretNoteList = await secretNoteRepository.addSecretNote(SecretModel(id:0, title: event.title, content: event.content, datetime: event.datetime));
      emit(InsertSecretNoteState());
    } catch (e) {
      emit(ErrorSecretNoteState());
    }
  }
}
