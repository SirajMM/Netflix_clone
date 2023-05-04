import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/search/searchService.dart';

import '../../../domain/downloads/models/downloads.dart';
import '../../../domain/search/model/search_respo/search_respo.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    //  idle state

    on<Initialize>((event, emit) async {
      if (state.idealList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idealList: state.idealList,
            isLoading: false,
            isError: false));
        return;
      }
      emit(const SearchState(
          searchResultList: [],
          idealList: [],
          isLoading: true,
          isError: false));
      //  get trending
      final _result = await _downloadsService.getDownloadsImage();
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idealList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idealList: list,
            isLoading: false,
            isError: false);
      });
      // show to ui
      emit(_state);
    });

    // search result state

    on<SearchMovie>((event, emit) async {
      // call search movie api
      log('Searching for${event.movieQuery}');
      emit(const SearchState(
          searchResultList: [],
          idealList: [],
          isLoading: true,
          isError: false));
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idealList: [],
            isLoading: false,
            isError: true);
      }, (SearchRespo r) {
        return SearchState(
            searchResultList: r.results!,
            idealList: [],
            isLoading: false,
            isError: false);
      });

      // show to ui
      emit(_state);
    });
  }
}
