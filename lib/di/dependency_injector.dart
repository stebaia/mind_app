import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:mind_app/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:mind_app/bloc/cubit/dark_theme_cubit/dark_theme_cubit.dart';
import 'package:mind_app/bloc/cubit/day_selected_cubit/day_selected_cubit.dart';
import 'package:mind_app/bloc/cubit/rating_cubit/rating_cubit_cubit.dart';
import 'package:mind_app/bloc/cubit/tags_cubit/tags_cubit.dart';
import 'package:mind_app/bloc/cubit/text_field_secret_note_cubit/text_field_secret_note_cubit.dart';
import 'package:mind_app/bloc/cubit/visibility_cubit/visibility_cubit.dart';
import 'package:mind_app/db/data.dart';
import 'package:mind_app/mappers/dto_mappers/days_dto_mapper.dart';
import 'package:mind_app/mappers/dto_mappers/user_dto_mapper.dart';
import 'package:mind_app/mappers/string_mappers/user_to_string_mapper.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/model/day_list.dart';
import 'package:mind_app/model/day_result.dart';
import 'package:mind_app/model/user.dart';
import 'package:mind_app/providers/dark_theme_provider.dart';
import 'package:mind_app/repositories/days_repository.dart';
import 'package:mind_app/repositories/secret_note_repository.dart';
import 'package:mind_app/repositories/user_repository.dart';
import 'package:mind_app/services/dto/days_dto.dart';
import 'package:mind_app/services/dto/user_dto.dart';
import 'package:mind_app/services/network/days_service/days_service.dart';
import 'package:mind_app/services/network/interceptors/auth_interceptors.dart';
import 'package:mind_app/services/network/user_service/user_service.dart';
import 'package:mind_app/utils/constants.dart';
import 'package:mind_app/utils/theme_helper.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:pine/pine.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

part 'blocs.dart';
part 'mappers.dart';
part 'providers.dart';
part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
      providers: _providers,
      blocs: _blocs,
      mappers: _mappers,
      repositories: _repositories,
      child: child);
}
