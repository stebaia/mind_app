import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_app/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_app/ui/components/example_chart.dart';
import 'package:mind_app/utils/theme_helper.dart';

class CorePage extends StatelessWidget {
  const CorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColorWhite,
      /*appBar: AppBar(
        title: Text(AppLocalizations.of(context).app_name),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            context.read<AuthCubit>().manualLogout();
          },
        ),
      ),*/
      body: SingleChildScrollView(child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthenticatedState) {
            return SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(
                      left: -140.0,
                      top: -200.0,
                      child: SvgPicture.asset(
                        'assets/blob.svg',
                        width: 500,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Hi ${state.user.name}',
                            style: TextStyle(
                                fontSize: 26, fontFamily: 'PoppinsExtrabold'),
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'You seem to be ',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                TextSpan(
                                    text: 'angry',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                TextSpan(
                                    text: ' today!',
                                    style: TextStyle(color: Colors.black)),
                              ])),
                          SizedBox(
                            height: 120,
                          ),
                          Text(
                            'Let off some steam...',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ThemeHelper.backgroundColorWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 220, 199, 216)
                                        .withOpacity(0.2),
                                    spreadRadius: 10,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                                color: ThemeHelper.secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            child: const Center(
                                                child:
                                                    Icon(CupertinoIcons.lock_circle, color: ThemeHelper.buttonColor,))),
                                        SizedBox(width: 10),
                                        const Text(
                                          'Add a secret note!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16),
                                        ),
                                      ]),
                                      const Text(
                                          'Feel like venting?\nWrite an ephemeral note and let the anger go..',
                                          style: TextStyle(fontSize: 13))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {},
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Let off some steam...',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(child: ExampleChart())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Container(
                  width: 30, height: 30, child: CircularProgressIndicator()),
            );
          }
        },
      )),
    );
  }
}
