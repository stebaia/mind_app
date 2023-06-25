import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_app/bloc/cubit/tags_cubit/tags_cubit.dart';

class TagsWidget extends StatefulWidget {
  const TagsWidget({super.key});

  @override
  State<TagsWidget> createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  List<String> tags = [];
  List<String> options = [
    'Work',
    'Relationships',
    'Love',
    'Family',
    'Sports',
    'Finances',
    'Fashion',
    'Travel',
    'Food',
    'Stress',
    'Lifestyle',
    'Mental health'
  ];

  @override
  Widget build(BuildContext context) {
    final TagsCubit cubit = BlocProvider.of<TagsCubit>(context);

    return BlocBuilder<TagsCubit, List<String>>(
      builder: (context, state) {
        return ChipsChoice<String>.multiple(
          value: cubit.state,
          onChanged: (val) => cubit.updateArray(val),
          choiceItems: C2Choice.listFrom<String, String>(
            source: options,
            value: (i, v) => v,
            label: (i, v) => v,
            tooltip: (i, v) => v,
          ),
          textDirection: TextDirection.rtl,
          wrapped: true,
        );
      },
    );
  }
}
