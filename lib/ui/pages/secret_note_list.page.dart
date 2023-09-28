import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_app/bloc/secret_note_bloc/secret_note_bloc.dart';
import 'package:mind_app/model/secret_note_model.dart';
import 'package:mind_app/providers/dark_theme_provider.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/utils/theme_helper.dart';
import 'package:provider/provider.dart';

class SecretNoteListPage extends StatelessWidget with AutoRouteWrapper {
  const SecretNoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: darkMode.darkTheme ? ThemeHelper.backgroundColorDark : ThemeHelper.backgroundColorWhite,
    
      body: BlocBuilder<SecretNoteBloc, SecretNoteState>(
        builder: (context, state) {
          if(state is LoadingSecretNoteState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchedListSecretNoteState) {
            List<SecretModel> secretList = state.secretNote;
            return Column(
              children: [
                const SizedBox(
              height: 60,
            ),
                Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(
                        CupertinoIcons.arrow_left,
                      ),
                      onPressed: () => context.popRoute()),
                  const Text(
                    'Keep your secret',
                    style:
                        TextStyle(fontSize: 26, fontFamily: 'PoppinsExtrabold'),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 34),
                    child: Image.asset(
                      'assets/incognito.png',
                      height: 24,
                      width: 24,
                    ),
                  ))
                ],
              ),
            ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: secretList.length,
                  itemBuilder:(context, index) => GestureDetector(
                    onTap: () => context.pushRoute(SecretNoteDetailRoute(secretModel: secretList[index])),
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(
                          
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(secretList[index].content, style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,)) ,
                            Text(secretList[index].datetime, style: const TextStyle(fontSize: 12),)
                          ],
                        )
                        
                      ]),
                    ),
                  )),
              ],
            );
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
