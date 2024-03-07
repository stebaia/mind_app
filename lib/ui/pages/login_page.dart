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
import 'package:lottie/lottie.dart';

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
        backgroundColor: ThemeHelper.colorSemiWhite,
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
           
            Container(
              padding: EdgeInsets.all(40),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () => context.pushRoute(RegistrationRoute()),
                    child: Text(
                      'Sing-up',
                      style: TextStyle(
                          color: ThemeHelper.buttonColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
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
                              msg: state.errorString,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Image(width: 110, height: 110, image: AssetImage('assets/happiness.png'),),
                                const SizedBox(height: 20,),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    'Hello, welcome!',
                                    style: TextStyle(
                                        fontSize: 26,
                                        color: Colors.black,
                                        fontFamily: 'PoppinsExtrabold'),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    'Please sing in to continue',
                                    style: TextStyle(
                                        fontSize: 14,
                                        
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                EmailFormField(
                                  'Username',
                                  color: ThemeHelper.transparentGray,
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
                                  color: ThemeHelper.transparentGray,
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
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                FunctionButton(
                                  text: 'Login',
                                  colorText: Colors.white,
                                  colorsBackground: ThemeHelper.buttonColor,
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
