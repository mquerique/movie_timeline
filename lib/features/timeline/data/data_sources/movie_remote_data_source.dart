import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_timeline/features/timeline/data/models/movie_model.dart';

class MovieRemoteDataSource {
  const MovieRemoteDataSource();

  ///
  /// This is simulating an API request using mock data from a json file.
  /// For a "real world" usage, we would make an actual http request here.
  ///
  Future<List<MovieModel>> listMovies() async {
    final mockJson = await rootBundle.loadString('assets/json/mock.json');

    // simulating API response time
    await Future.delayed(const Duration(seconds: 1));

    final response = json.decode(mockJson);
    return response['mcu']
        .map((it) => MovieModel.fromJson(it))
        .toList()
        .cast<MovieModel>();
  }
}
