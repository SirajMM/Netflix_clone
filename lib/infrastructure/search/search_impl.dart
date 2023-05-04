import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/search/model/search_respo/search_respo.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/search/searchService.dart';

import '../../domain/core/api_end_points.dart';
import '../../domain/downloads/models/downloads.dart';

@LazySingleton(as: SearchService)
class SearchImple implements SearchService {
  @override
  Future<Either<MainFailure, SearchRespo>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(APiEndPoints.search, queryParameters: {
        'query': movieQuery,
      });
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchRespo.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
