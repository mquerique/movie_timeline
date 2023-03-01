import 'package:flutter/material.dart';
import 'package:movie_timeline/core/constants/constants.dart';
import 'package:movie_timeline/core/constants/dimensions.dart';
import 'package:movie_timeline/features/timeline/domain/entities/movie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailsScreen({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
      backgroundColor: Colors.black,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImage(),
        Padding(
          padding: const EdgeInsets.all(kSpacingRegular),
          child: Column(
            children: [
              _buildTitle(),
              const SizedBox(height: kSpacingSmall),
              _buildDescription(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.network(
        kMovieDbImageBaseUrl + widget.movie.backdropPath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Text(
                '${widget.movie.title} ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('(${widget.movie.releaseDate.year})'),
            ],
          ),
          const SizedBox(height: kSpacingRegular),
          Text(
            AppLocalizations.of(context)!.rating(
              '${widget.movie.voteAverage.round()}',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.movie.overview,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
