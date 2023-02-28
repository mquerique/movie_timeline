import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_timeline/core/constants/dimensions.dart';
import 'package:movie_timeline/features/timeline/presentation/blocs/movie_bloc.dart';
import 'package:movie_timeline/features/timeline/presentation/widgets/timeline_listview.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key? key}) : super(key: key);

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(const ListMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/endgame_poster.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (ctx, state) {
          if (state is MovieInitialState || state is MovieLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MovieLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: kSpacingRegular),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!
                            .marvelCinematicUniverse
                            .toUpperCase()
                            .replaceAll(" ", "\n"),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: kSpacingLarge),
                      Text(
                        AppLocalizations.of(context)!.timeline.toUpperCase(),
                        style:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: kSpacingSmall),
                TimelineListview(movies: state.movies),
              ],
            );
          }
          return Text(AppLocalizations.of(ctx)!.errSomethingWentWrong);
        },
      ),
    );
  }
}
