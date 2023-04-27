import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginButton extends StatelessWidget {
  final bool loading;
  final GestureTapCallback? onPressed;

  const LoginButton({super.key, this.loading = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            height: 46,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width / 1.4,
            child: Center(
                child: !loading
                    ? Text(
                        'Login'.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.normal),
                      )
                    : const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        )))));
  }
}

class MainButton extends StatelessWidget {
  MainButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.color});

  String title;
  Color color;
  GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
