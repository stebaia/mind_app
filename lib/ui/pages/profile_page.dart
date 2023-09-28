import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:mind_app/bloc/cubit/dark_theme_cubit/dark_theme_cubit.dart';
import 'package:mind_app/providers/dark_theme_provider.dart';
import 'package:mind_app/utils/theme_helper.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
 Widget build(BuildContext context) {
    final themeChange = context.read<DarkThemeCubit>();
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: darkMode.darkTheme
                  ? ThemeHelper.backgroundColorDark
                  : CupertinoColors.white,
      body: SingleChildScrollView(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        SizedBox(height: 100,),
        Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Preferenze'.toUpperCase(),
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              letterSpacing: 1.6,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
        TextButton(child: Text('Logout',),onPressed: () => context.read<AuthCubit>().manualLogout(),),
        Container(
        height: 50,
        color: darkMode.darkTheme
                  ? CupertinoColors.label
                  : CupertinoColors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.moon,
                  color: darkMode.darkTheme
                  ? CupertinoColors.white
                  : CupertinoColors.black
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Dark Mode',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color:darkMode.darkTheme
                  ? CupertinoColors.white
                  : CupertinoColors.black
                  ),
                 ),
                Spacer(),
                CupertinoSwitch(
                  value: darkMode.darkTheme,
                  onChanged: (value) {
                    darkMode.darkTheme = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      ]),)
      
    );
  }
}