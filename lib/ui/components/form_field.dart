import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  final String label;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? formFieldValidator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction? textInputAction;

  const EmailFormField(
    this.label, {
    super.key,
    this.textEditingController,
    this.focusNode,
    this.formFieldValidator,
    this.onFieldSubmitted,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.4,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          style: TextStyle(fontSize: 18),
          cursorColor: Colors.grey,
          controller: textEditingController,
          focusNode: focusNode,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
            prefixIcon: const Icon(
              CupertinoIcons.person,
              size: 18,
              color: Colors.grey,
            ),
          ),
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: textInputAction,
        ));
  }
}

class PasswordFormField extends StatefulWidget {
  final String label;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? formFieldValidator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool enalbed;

  const PasswordFormField(this.label,
      {super.key,
      this.textEditingController,
      this.focusNode,
      this.formFieldValidator,
      this.onFieldSubmitted,
      this.textInputAction,
      this.enalbed = true});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.4,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          style: TextStyle(fontSize: 18),
          cursorColor: Colors.grey,
          enabled: widget.enalbed,
          controller: widget.textEditingController,
          focusNode: widget.focusNode,
          obscureText: _obscureText,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: widget.label,
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: () => setState(() {
                _obscureText = !_obscureText;
              }),
              child: Icon(
                _obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                size: 18,
                color: Colors.grey,
              ),
            ),
            prefixIcon: const Icon(
              CupertinoIcons.lock,
              color: Colors.grey,
              size: 18,
            ),
          ),
          validator: widget.formFieldValidator,
          onFieldSubmitted: widget.onFieldSubmitted,
          textInputAction: widget.textInputAction,
        ));
  }
}
