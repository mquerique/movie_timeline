import 'package:get_it/get_it.dart';
import 'package:movie_timeline/core/themes/bloc/theme_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerFactory(() => ThemeBloc());
}
