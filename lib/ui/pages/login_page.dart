import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:mind_app/bloc/login_bloc/login_bloc.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/ui/components/buttons.dart';
import 'package:mind_app/ui/components/form_field.dart';
import 'package:mind_app/ui/pages/registration_page.dart';
import 'package:mind_app/utils/theme_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget with AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<LoginBloc>(
            create: ((context) => LoginBloc(userRepository: context.read())))
      ], child: this);
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  final _singUpEmailController = TextEditingController();
  final _singUpPasswordController = TextEditingController();

  bool _formValid = false;
  bool rememberPassword = false;

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeHelper.backgroundColorWhite,
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Positioned(
              left: -120.0,
              top: -50.0,
              child: SvgPicture.asset(
                'assets/blob.svg',
                height: 300,
              ),
            ),
            Positioned(
              right: 0.0,
              top: 60.0,
              child: SvgPicture.asset(
                'assets/blob.svg',
                height: 100,
              ),
            ),
            Positioned(
              right: 40.0,
              bottom: 0.0,
              child: SvgPicture.asset(
                'assets/blob.svg',
                height: 150,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 100),
                alignment: Alignment.topCenter,
                child: Text(
                  'Ciao, benvenuto!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Form(
                      onChanged: () {
                        final isValid =
                            _formKey.currentState?.validate() ?? false;
                        setState(() {
                          _formValid = isValid;
                        });
                      },
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: BlocConsumer<LoginBloc, LoginInState>(
                        listener: (context, state) {
                          if (state is LoggedInState) {
                            context.read<AuthCubit>().authenticated(state.user);
                          } else if (state is ErrorLoginInState) {
                            //showErrorDialog
                            Fluttertoast.showToast(
                              msg: AppLocalizations.of(context).login_error,
                            );
                          }
                        },
                        builder: (context, state) {
                          /*if (state is ErrorLoginInState) {
                            Fluttertoast.showToast(
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              msg: AppLocalizations.of(context)!.login_error,
                            );
                          }*/
                          return SingleChildScrollView(
                              child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                EmailFormField(
                                  'Username',
                                  color: Colors.black12,
                                  textEditingController: _singUpEmailController,
                                  focusNode: _focusNodeEmail,
                                  formFieldValidator: (value) {
                                    if (value == null && value!.length < 2) {
                                      return null;
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (value) =>
                                      _focusNodePassword.requestFocus(),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                PasswordFormField(
                                  'Password',
                                  color: Colors.black12,
                                  textInputAction: TextInputAction.go,
                                  textEditingController:
                                      _singUpPasswordController,
                                  focusNode: _focusNodePassword,
                                  formFieldValidator: (value) {
                                    if (value == null || value.length < 8) {
                                      return null;
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    if (_formValid) {
                                      context.read<LoginBloc>().loginIn(
                                            email: _singUpEmailController.text,
                                            password:
                                                _singUpPasswordController.text,
                                          );
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                FunctionButton(
                                  text: 'Login',
                                  loading: state is TryLogginInState,
                                  onPressed: () {
                                    if (_formValid) {
                                      context.read<LoginBloc>().loginIn(
                                            email: _singUpEmailController.text,
                                            password:
                                                _singUpPasswordController.text,
                                          );
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                FunctionButton(
                                  text: 'Registrazione',
                                  onPressed: () {
                                    context
                                        .pushRoute(const RegistrationRoute());
                                  },
                                ),
                              ],
                            ),
                          ));
                        },
                      ))),
            ),
          ]),
        ));
  }
}
