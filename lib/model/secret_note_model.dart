import 'package:equatable/equatable.dart';

class SecretModel extends Equatable{

  int id;
  String title;
  String content;
  String datetime;

  SecretModel({required this.id, required this.title, required this.content,  required this.datetime});


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}