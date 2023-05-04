import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mind_app/utils/theme_helper.dart';

class SecretNoteListPage extends StatelessWidget {
  const SecretNoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColorWhite,
      appBar: AppBar(
        title: Text('Secret note list'),
      ),
      body: Container(),
    );
  }
}