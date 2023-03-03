import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_timeline/core/themes/bloc/theme_bloc.dart';
import 'package:movie_timeline/features/timeline/presentation/blocs/movie_bloc.dart';
import 'package:movie_timeline/features/timeline/presentation/screens/timeline_screen.dart';
import 'package:movie_timeline/service_locator.dart' as sl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sl.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl.getIt<ThemeBloc>()),
        BlocProvider(
          create: (_) => sl.getIt<MovieBloc>()..add(const ListMoviesEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildApp,
      ),
    );
  }

  Widget _buildApp(BuildContext context, ThemeState state) {
    return MaterialApp(
      title: 'Movie Timeline',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: state.themeData,
      home: const TimelineScreen(),
    );
  }
}
