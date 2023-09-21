part of 'secret_note_bloc.dart';

class SecretNoteState extends Equatable {
  const SecretNoteState();
  
  @override
  List<Object> get props => [];
}

class EmptySecretNoteState extends SecretNoteState {
  const EmptySecretNoteState();
}

class FetchedListSecretNoteState extends SecretNoteState {
  final List<SecretModel> secretNote;
  const FetchedListSecretNoteState(this.secretNote);
  List<Object> get props => [secretNote];
}

class FetchedSingleSecretNoteState extends SecretNoteState {
  final List<SecretModel> secretNote;
  const FetchedSingleSecretNoteState(this.secretNote);
  List<Object> get props => [secretNote];
}

class ErrorSecretNoteState extends SecretNoteState {
  const ErrorSecretNoteState();
}

class LoadingSecretNoteState extends SecretNoteState {
  const LoadingSecretNoteState();
}

class InsertSecretNoteState extends SecretNoteState {
  const InsertSecretNoteState();
}