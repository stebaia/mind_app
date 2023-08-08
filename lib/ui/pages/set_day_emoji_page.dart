import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:mind_app/bloc/cubit/rating_cubit/rating_cubit_cubit.dart';
import 'package:mind_app/bloc/cubit/tags_cubit/tags_cubit.dart';
import 'package:mind_app/bloc/cubit/visibility_cubit/visibility_cubit.dart';
import 'package:mind_app/bloc/day_bloc/day_bloc.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/routes/app_router.gr.dart';
import 'package:mind_app/ui/components/buttons.dart';
import 'package:mind_app/ui/components/face_feedback.dart';
import 'package:mind_app/ui/components/tags_widget.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/theme_helper.dart';
import 'package:textfield_tags/textfield_tags.dart';

class SetDayEmojiPage extends StatefulWidget with AutoRouteWrapper {
  const SetDayEmojiPage({super.key, this.passedDay, required this.isFirstTime});
  final Day? passedDay;
  final bool isFirstTime;
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<DayBloc>(
            create: ((context) => DayBloc(daysRepository: context.read())))
      ], child: this);
  @override
  State<SetDayEmojiPage> createState() => _SetDayEmojiPageState();
}

class _SetDayEmojiPageState extends State<SetDayEmojiPage> {
  late TextfieldTagsController _tagsController;

  @override
  void initState() {
    super.initState();
    _tagsController = TextfieldTagsController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tagsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.passedDay != null) {
      context
          .read<RatingCubitCubit>()
          .changeValue(widget.passedDay!.mood.toDouble());
    }

    final sliderValue = context.read<RatingCubitCubit>();
    final user = context.read<AuthCubit>();
    final tagsCubit = context.read<TagsCubit>();

    TextEditingController controller = TextEditingController(
        text: widget.passedDay != null ? widget.passedDay!.note : '');

    return BlocConsumer<DayBloc, DayState>(
      listener: (context, state) {
        if (state is ResultSetDayState) {
          widget.isFirstTime
              ? context.pushRoute(CoreRoute())
              : context.popRoute();
        } else if (state is ErrorSetDayState) {
          Fluttertoast.showToast(msg: "error, please retry later!");
        }
      },
      builder: (context, setDayState) {
        return BlocBuilder<RatingCubitCubit, RatingCubitInitial>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Positioned(
                      left: -100.0,
                      top: -50.0,
                      child: SvgPicture.asset(
                        'assets/blob.svg',
                        height: 260,
                      ),
                    ),
                    Positioned(
                      right: 0.0,
                      top: 50.0,
                      child: SvgPicture.asset(
                        'assets/blob.svg',
                        height: 150,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          context.read<TagsCubit>().deleteAll();
                          if (widget.isFirstTime) {
                            context.pushRoute(CoreRoute());
                          } else {
                            context.popRoute();
                          }
                        },
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.close)),
                      ),
                    ),
                    BlocBuilder<VisibilityCubit, VisibilityCubitInitial>(
                      builder: (context, visibilityState) {
                        if (visibilityState.isVisible) {
                          return Center(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                  ),
                                  const Text(
                                    'Describe what is happened',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'PoppinsExtrabold'),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: TextField(
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      controller: controller,
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 14),
                                          hintText: 'What\'s going on?',
                                          filled: true,
                                          fillColor:
                                              ThemeHelper.backgroundColorWhite,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          )),
                                      maxLines: 200 ~/ 20,
                                      keyboardType: TextInputType.multiline,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Autocomplete<String>(
                                    optionsViewBuilder:
                                        (context, onSelected, options) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 4.0),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Material(
                                            elevation: 4.0,
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  maxHeight: 200),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: options.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  final dynamic option =
                                                      options.elementAt(index);
                                                  return TextButton(
                                                    onPressed: () {
                                                      onSelected(option);
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 15.0),
                                                        child: Text(
                                                          '#$option',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    74,
                                                                    137,
                                                                    92),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    optionsBuilder:
                                        (TextEditingValue textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
                                      }
                                      return DateConverter.tagNameHelper
                                          .where((String option) {
                                        return option.contains(textEditingValue
                                            .text
                                            .toLowerCase());
                                      });
                                    },
                                    onSelected: (String selectedTag) {
                                      _tagsController.addTag = selectedTag;
                                    },
                                    fieldViewBuilder:
                                        (context, ttec, tfn, onFieldSubmitted) {
                                      return TextFieldTags(
                                        textEditingController: ttec,
                                        focusNode: tfn,
                                        textfieldTagsController:
                                            _tagsController,
                                        initialTags: const [],
                                        textSeparators: const [' ', ','],
                                        letterCase: LetterCase.normal,
                                        validator: (String tag) {
                                          if (_tagsController.getTags!
                                              .contains(tag)) {
                                            return 'you already entered that';
                                          }
                                          return null;
                                        },
                                        inputfieldBuilder: (context, tec, fn,
                                            error, onChanged, onSubmitted) {
                                          return ((context, sc, tags,
                                              onTagDelete) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: TextField(
                                                controller: tec,
                                                focusNode: fn,
                                                decoration: InputDecoration(
                                                  border:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: ThemeHelper
                                                            .buttonSecondaryColor,
                                                        width: 3.0),
                                                  ),
                                                  focusedBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: ThemeHelper
                                                            .buttonSecondaryColor,
                                                        width: 3.0),
                                                  ),
                                                  helperText:
                                                      'Enter language...',
                                                  helperStyle: const TextStyle(
                                                    color: ThemeHelper
                                                        .buttonSecondaryColor,
                                                  ),
                                                  hintText:
                                                      _tagsController.hasTags
                                                          ? ''
                                                          : "Enter tag...",
                                                  errorText: error,
                                                  prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.74),
                                                  prefixIcon: tags.isNotEmpty
                                                      ? SingleChildScrollView(
                                                          controller: sc,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                              children: tags
                                                                  .map((String
                                                                      tag) {
                                                            return Container(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          20.0),
                                                                ),
                                                                color: ThemeHelper
                                                                    .buttonSecondaryColor,
                                                              ),
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10.0),
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0,
                                                                  vertical:
                                                                      4.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  InkWell(
                                                                    child: Text(
                                                                      '#$tag',
                                                                      style: const TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    onTap: () {
                                                                      //print("$tag selected");
                                                                    },
                                                                  ),
                                                                  const SizedBox(
                                                                      width:
                                                                          4.0),
                                                                  InkWell(
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      size:
                                                                          14.0,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          233,
                                                                          233,
                                                                          233),
                                                                    ),
                                                                    onTap: () {
                                                                      onTagDelete(
                                                                          tag);
                                                                    },
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          }).toList()),
                                                        )
                                                      : null,
                                                ),
                                                onChanged: onChanged,
                                                onSubmitted: onSubmitted,
                                              ),
                                            );
                                          });
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    padding: EdgeInsets.all(20),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () => BlocProvider.of<
                                                    VisibilityCubit>(context)
                                                .changeVisibility(false),
                                            child: Container(
                                              padding: EdgeInsets.all(18),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: ThemeHelper
                                                      .buttonSecondaryColor),
                                              child: Icon(
                                                CupertinoIcons.arrow_left,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print(_tagsController
                                                  .textEditingController!.text);
                                              context.read<DayBloc>().setDay(
                                                  userId: (user.state
                                                          as AuthenticatedState)
                                                      .user
                                                      .id,
                                                  day: !widget.isFirstTime
                                                      ? DateConverter.getDateNowWithFormatSimpleWithParameter(
                                                          widget.passedDay!.day)
                                                      : DateConverter
                                                          .getDateNowWithFormatSimples(),
                                                  mood:
                                                      (sliderValue.state.value)
                                                          .round(),
                                                  note: controller.text,
                                                  tags: tagsCubit.state
                                                      .map((string) =>
                                                          string.toLowerCase())
                                                      .toList(),
                                                  timestamp: DateConverter
                                                      .getDateNowWithFormatSimples());
                                              context
                                                  .read<TagsCubit>()
                                                  .deleteAll();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(18),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: ThemeHelper
                                                      .buttonSecondaryColor),
                                              child: setDayState
                                                      is TrySetDayState
                                                  ? Center(
                                                      child: Container(
                                                          height: 24,
                                                          child:
                                                              CircularProgressIndicator()),
                                                    )
                                                  : Text(
                                                      'Send',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 120,
                                  ),
                                  Text(
                                    'Hey! how was your day today?',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'PoppinsExtrabold'),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: BlocBuilder<RatingCubitCubit,
                                        RatingCubitInitial>(
                                      builder: (context, state) {
                                        return faceFeedback(
                                            state.value.toInt());
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                      child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: Slider(
                                      activeColor: ThemeHelper.buttonColor,
                                      value: state.value,
                                      max: 5,
                                      min: 1,
                                      divisions: 4,
                                      onChanged: (double value) {
                                        BlocProvider.of<RatingCubitCubit>(
                                                context)
                                            .changeValue(value);
                                      },
                                    ),
                                  )),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        BlocProvider.of<VisibilityCubit>(
                                                context)
                                            .changeVisibility(true),
                                    child: Container(
                                      padding: EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color:
                                              ThemeHelper.buttonSecondaryColor),
                                      child: Icon(
                                        CupertinoIcons.arrow_right,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
