import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mind_app/bloc/cubit/text_field_secret_note_cubit/text_field_secret_note_cubit.dart';
import 'package:mind_app/bloc/secret_note_bloc/secret_note_bloc.dart';
import 'package:mind_app/model/secret_note_model.dart';
import 'package:mind_app/ui/components/buttons.dart';
import 'package:mind_app/utils/theme_helper.dart';

class SecretNoteDetailPage extends StatefulWidget with AutoRouteWrapper {
  const SecretNoteDetailPage({super.key, this.secretModel});

  final SecretModel? secretModel;

  @override
  State<SecretNoteDetailPage> createState() => _SecretNoteDetailPageState();
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<SecretNoteBloc>(
          create: (context) =>
              SecretNoteBloc(secretNoteRepository: context.read()),
        )
      ], child: this);
}

class _SecretNoteDetailPageState extends State<SecretNoteDetailPage> {
  TextEditingController textTitleEditingController = TextEditingController();

  String? _modifiedText;

  @override
  void initState() {
    super.initState();
    if (widget.secretModel != null) {
      textTitleEditingController.text = widget.secretModel!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColorWhite,
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(
                        CupertinoIcons.arrow_left,
                      ),
                      onPressed: () => context.popRoute()),
                  Text(
                    widget.secretModel != null
                        ? 'Edit a secret note'
                        : 'Add the secret note',
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
            Container(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Column(children: [
                Text(
                  'Did something happen? this is a safe place, vent and write whatever comes into your head',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: ThemeHelper.buttonSecondaryColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Icon(
                    CupertinoIcons.calendar,
                    color: ThemeHelper.buttonColor,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(widget.secretModel != null
                      ? widget.secretModel!.datetime
                      : DateFormat('EEEE, d MMM yyyy').format(DateTime.now())),
                ]),
                SizedBox(
                  height: 20,
                ),
                
                     SizedBox(
                      height: 300,
                      child: TextFormField(
                        
                        controller: textTitleEditingController,
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 14),
                            hintText: 'What\'s going on?',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                        maxLines: 300 ~/ 20,
                        keyboardType: TextInputType.multiline,
                      ),
                   
                ),
                SizedBox(
                  height: 20,
                ),
                BlocConsumer<SecretNoteBloc, SecretNoteState>(
                  listener: (context, state) {
                    if (state is InsertSecretNoteState) {
                      Fluttertoast.showToast(msg: 'Nota segreta inserita!');
                      context.popRoute();
                    }
                  },
                  builder: (context, state) {
                    return FunctionButton(
                      loading: state is! LoadingSecretNoteState,
                      colorText: Colors.white,
                      colorsBackground: widget.secretModel != null ? ThemeHelper.disabledColor : ThemeHelper.buttonSecondaryColor ,
                      text: 'Invia!',
                      onPressed: () {
                        widget.secretModel != null
                            ? null
                            : context.read<SecretNoteBloc>().insertSecretNote(
                                title: textTitleEditingController.text,
                                content: textTitleEditingController.text,
                                datetime: DateFormat('EEEE, d MMM yyyy')
                                    .format(DateTime.now()));
                      },
                    );
                  },
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
