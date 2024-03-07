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
import 'package:mind_app/utils/app_utils.dart';
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
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  final _focusNodeName = FocusNode();
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  final _focusNodeConfirmPassword = FocusNode();
  final _focusNodeSurname = FocusNode();
  final _focusNodeUsername = FocusNode();
  final _focusNodeBirth = FocusNode();
  final _registrationNameController = TextEditingController();
  final _registrationEmailController = TextEditingController();
  final _registrationPasswordController = TextEditingController();
  final _registrationPasswordConfirmController = TextEditingController();
  final _registrationSurnameController = TextEditingController();
  final _registrationUsernameController = TextEditingController();
  final _registrationBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          locale: Locale("it", "IT"),
          fieldHintText: "gg/mm/aaaa",
          fieldLabelText: "gg/mm/aaaa",
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1900),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          _registrationBirthController.text =
              DateConverter.convertDateToISO(selectedDate.toString());
        });
      }
    }

    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColorWhite,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              
              Positioned(
                top: 60,
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          CupertinoIcons.arrow_left,
                        ),
                        onPressed: () => context.popRoute()),
                    Text(
                      'Registration',
                      style: TextStyle(
                          fontSize: 26, fontFamily: 'PoppinsExtrabold'),
                    ),
                  ],
                ),
              ),
              Center(
                child: BlocConsumer<LoginBloc, LoginInState>(
                  listener: (context, state) {
                    if (state is LoggedInState) {
                      Fluttertoast.showToast(
                        msg: 'Registrazione',
                      );
                      context.popRoute();
                    } else if (state is ErrorLoginInState) {
                      //showErrorDialog
                      Fluttertoast.showToast(
                        msg: state.errorString,
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
                            textCapitalization: TextCapitalization.words,
                            focusNode: _focusNodeName,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          EmailFormField(
                            'surname',
                            iconCustom: CupertinoIcons.person,
                            textCapitalization: TextCapitalization.words,
                            textEditingController:
                                _registrationSurnameController,
                            focusNode: _focusNodeSurname,
                            color: Colors.white
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          
                          EmailFormField(
                            'email',
                            iconCustom: CupertinoIcons.mail,
                            textEditingController: _registrationEmailController,
                            focusNode: _focusNodeEmail,
                            color: Colors.white
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DateFormField(
                            'birth',
                            gestureTapCallback: () => _selectDate(context),
                            iconCustom: CupertinoIcons.calendar,
                            textEditingController: _registrationBirthController,
                            color: Colors.white
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          PasswordFormField(
                            'password',
                            textEditingController:
                                _registrationPasswordController,
                            focusNode: _focusNodePassword,
                            color: Colors.white
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordFormField(
                            'confirm password',
                            textEditingController:
                                _registrationPasswordConfirmController,
                            focusNode: _focusNodeConfirmPassword,
                            color: Colors.white
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FunctionButton(
                            colorText: Colors.white,
                            colorsBackground: ThemeHelper.buttonColor,
                            text: 'Registration',
                            loading: state is TryLogginInState,
                            onPressed: () {
                              if (_registrationPasswordConfirmController.text ==
                                  _registrationPasswordController.text) {
                                context.read<LoginBloc>().registration(
                                    email: _registrationEmailController.text,
                                    password:
                                        _registrationPasswordController.text,
                                    name: _registrationNameController.text,
                                    surname:
                                        _registrationSurnameController.text,
                                    birth: _registrationBirthController.text
                                        .replaceAll("/", "-"),
                                    username:
                                        _registrationUsernameController.text);
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Password not match');
                              }
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
