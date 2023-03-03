import 'package:flutter/material.dart';
import 'package:movie_timeline/core/constants/dimensions.dart';
import 'package:movie_timeline/features/timeline/domain/entities/movie.dart';
import 'package:movie_timeline/features/timeline/presentation/widgets/movie_card.dart';

class TimelineListview extends StatelessWidget {
  final List<Movie> movies;

  const TimelineListview({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.4;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: kSpacingRegular),
        itemCount: movies.length,
        separatorBuilder: (_, __) {
          return const SizedBox(width: kSpacingRegular);
        },
        itemBuilder: (_, index) {
          return MovieCard(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
