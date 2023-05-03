import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mind_app/bloc/login_bloc/login_bloc.dart';
import 'package:mind_app/ui/components/buttons.dart';
import 'package:mind_app/ui/components/form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mind_app/utils/theme_helper.dart';

class RegistrationPage extends StatefulWidget with AutoRouteWrapper {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<LoginBloc>(
            create: ((context) => LoginBloc(userRepository: context.read())))
      ], child: this);
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _focusNodeName = FocusNode();
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  final _registrationNameController = TextEditingController();
  final _registrationEmailController = TextEditingController();
  final _registrationPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColorWhite,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                right: -120.0,
                top: -50.0,
                child: SvgPicture.asset(
                  'assets/blob.svg',
                  height: 300,
                ),
              ),
              Positioned(
                left: 0.0,
                top: 90.0,
                child: SvgPicture.asset(
                  'assets/blob.svg',
                  height: 150,
                ),
              ),
              Positioned(
                left: -80.0,
                bottom: -40.0,
                child: SvgPicture.asset(
                  'assets/blob.svg',
                  height: 150,
                ),
              ),
              Positioned(
                right: -40,
                bottom: -100.0,
                child: SvgPicture.asset(
                  'assets/blob_two.svg',
                  height: 300,
                ),
              ),
              Positioned(
                top: 60,
                child: Row(
                  children: [
                    IconButton(icon: Icon(CupertinoIcons.arrow_left,), onPressed: () => context.popRoute()),
                    Text(
                                      'Registration',
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontFamily: 'PoppinsExtrabold'),
                                    ),
                                  
                  ],
                ),
              ),
                Center(
                  child: BlocConsumer<LoginBloc, LoginInState>(
                    listener: (context, state) {
                      if (state is LoggedInState) {
                        Fluttertoast.showToast(
                          msg: AppLocalizations.of(context).registration_confirm,
                        );
                        context.popRoute();
                      } else if (state is ErrorLoginInState) {
                        //showErrorDialog
                        Fluttertoast.showToast(
                          msg: AppLocalizations.of(context).login_error,
                        );
                      }
                    },
                    builder: (context, state) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              
                              EmailFormField(
                                'nome',
                                textEditingController: _registrationNameController,
                                focusNode: _focusNodeName,
                                color: Color.fromARGB(255, 208, 208, 212),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              EmailFormField(
                                'email',
                                iconCustom: CupertinoIcons.mail,
                                textEditingController: _registrationEmailController,
                                focusNode: _focusNodeEmail,
                                color: Color.fromARGB(255, 208, 208, 212),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PasswordFormField(
                                'password',
                                textEditingController: _registrationPasswordController,
                                focusNode: _focusNodePassword,
                                color: Color.fromARGB(255, 208, 208, 212),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PasswordFormField(
                                'confirm password',
                                textEditingController: _registrationPasswordController,
                                focusNode: _focusNodePassword,
                                color: Color.fromARGB(255, 208, 208, 212),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FunctionButton(
                                colorText: Colors.white,
                                colorsBackground: ThemeHelper.mainColor,
                                text: 'Registrazione',
                                loading: state is TryLogginInState,
                                onPressed: () {
                                  context.read<LoginBloc>().registration(
                                      email: _registrationEmailController.text,
                                      password: _registrationPasswordController.text,
                                      name: _registrationNameController.text);
                                },
                              ),
                            ],
                          ),
                        
                      );
                    },
                  ),
                ),
              ],
            ),
          
        ),
      ),
    );
  }
}
