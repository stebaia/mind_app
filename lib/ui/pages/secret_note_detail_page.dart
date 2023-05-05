import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:mind_app/ui/components/buttons.dart';
import 'package:mind_app/utils/theme_helper.dart';

class SecretNoteDetailPage extends StatelessWidget {
  const SecretNoteDetailPage({super.key});

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
                  const Text(
                    'Add a secret note',
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
                  Text(DateFormat('EEEE, d MMM yyyy').format(DateTime.now())),
                ]),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 300,
                  child: TextField(
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
                FunctionButton(
                  colorText: Colors.white,
                  colorsBackground: ThemeHelper.buttonSecondaryColor,
                  text: 'Invia!',
                  onPressed: () {},
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
