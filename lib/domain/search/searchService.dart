import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';

import 'model/search_respo/search_respo.dart';

abstract class SearchService {
  Future<Either<MainFailure,SearchRespo>>searchMovies({
    required String movieQuery,
  });
}