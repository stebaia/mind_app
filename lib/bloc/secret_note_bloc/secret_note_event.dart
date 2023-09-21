part of 'secret_note_bloc.dart';

abstract class SecretNoteEvent extends Equatable {
  const SecretNoteEvent();

  @override
  List<Object> get props => [];
}

class GetSecretNoteList extends SecretNoteEvent {
  @override
  List<Object> get props => [];
}

class GetSecretNoteSingle extends SecretNoteEvent {

  final int id;
  const GetSecretNoteSingle({required this.id});

  @override
  List<Object> get props => [];
}

class InsertSecretNote extends SecretNoteEvent {
  final String title;
  final String content;
  final String datetime;

  const InsertSecretNote({
    required this.title,
    required this.content,
    required this.datetime
  });
}