import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:mind_app/db/data.dart';
import 'package:mind_app/model/secret_note_model.dart';

class SecretNoteRepository {
  final Logger logger;

  final MyDatabase database;
  SecretNoteRepository({
    required this.database,
    required this.logger,
  });

  // Metodo per ottenere tutte le SecretNote
  Future<List<SecretModel>> getAllSecretNotes() async {
  final secretNoteDataList = await database.select(database.secretNote).get();
  final secretModelList = secretNoteDataList.map((secretNoteData) {
    return SecretModel(
      // Mappa i campi della SecretNoteData al modello SecretModel
      id: secretNoteData.id,
      title: secretNoteData.title,
      content: secretNoteData.content,
      datetime: secretNoteData.date,
    );
  }).toList();
  return secretModelList;
}

  // Metodo per ottenere una SecretNote specifica per ID
  Future<SecretModel?> getById(int id) async {
  final secretNoteData = await (database.select(database.secretNote)
        ..where((tbl) => tbl.id.equals(id)))
      .getSingleOrNull();
  
  if (secretNoteData != null) {
    return SecretModel(
      id: secretNoteData.id,
      title: secretNoteData.title,
      content: secretNoteData.content,
      datetime: secretNoteData.date,
    );
  } else {
    return null;
  }
}

  // Metodo per aggiungere una nuova SecretNote
  Future<void> addSecretNote(SecretModel secretNoteModel) {
    return database.into(database.secretNote).insert(SecretNoteCompanion.insert(
        title: secretNoteModel.title,
        content: secretNoteModel.content,
        date: secretNoteModel.datetime));
  }
}
