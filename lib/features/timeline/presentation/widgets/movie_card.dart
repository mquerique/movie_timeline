import 'package:flutter/material.dart';
import 'package:movie_timeline/core/constants/constants.dart';
import 'package:movie_timeline/core/constants/dimensions.dart';
import 'package:movie_timeline/features/timeline/domain/entities/movie.dart';
import 'package:movie_timeline/features/timeline/presentation/screens/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  static const _cardWidth = 140.0;

  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: _buildImage(context),
          ),
          Text(
            '${movie.title}\n',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge!,
          ),
          Text(
            '(${movie.releaseDate.year})',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 32,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => MovieDetailsScreen(movie: movie),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: Image.network(
            kMovieDbImageBaseUrl + movie.posterPath,
            width: _cardWidth,
            loadingBuilder: (_, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
