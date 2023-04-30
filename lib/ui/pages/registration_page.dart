import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  EmailFormField(
                    'nome',
                    textEditingController: _registrationNameController,
                    focusNode: _focusNodeName,
                    color: Colors.black12,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EmailFormField(
                    'email',
                    textEditingController: _registrationEmailController,
                    focusNode: _focusNodeEmail,
                    color: Colors.black12,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordFormField(
                    'password',
                    textEditingController: _registrationPasswordController,
                    focusNode: _focusNodePassword,
                    color: Colors.black12,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
