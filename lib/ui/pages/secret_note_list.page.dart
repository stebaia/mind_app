import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_app/bloc/secret_note_bloc/secret_note_bloc.dart';
import 'package:mind_app/model/secret_note_model.dart';
import 'package:mind_app/utils/theme_helper.dart';

class SecretNoteListPage extends StatelessWidget with AutoRouteWrapper {
  const SecretNoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColorWhite,
      appBar: AppBar(
        title: Text('Secret note list'),
      ),
      body: BlocBuilder<SecretNoteBloc, SecretNoteState>(
        builder: (context, state) {
          if(state is LoadingSecretNoteState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchedListSecretNoteState) {
            List<SecretModel> secretList = state.secretNote;
            return ListView.builder(
              itemBuilder:(context, index) => Text(secretList[index].title),itemCount: secretList.length,);
          }else if (state is EmptySecretNoteState){
            return const Center(child: Text('Nessuna nota segreta presente'));
          }else {
            return const Center(child: Text('Errore'));
          }
          
        },
      ),
    );
  }
  
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
    BlocProvider<SecretNoteBloc>(create:(context) => SecretNoteBloc(secretNoteRepository: context.read())..getSecretNoteList(),)
  ], child: this);
}
