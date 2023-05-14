// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new_resp/hot_and_new_service.dart';

import '../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';
part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HotAndNewService _homeService;

  HomeBloc(this._homeService) : super(HomeState.initial()) {
    // on event get homescreen data
    on<HomeEvent>((event, emit) async {
      log('GETTING HOME SCREEN DATA');
      // send loading to ui

      emit(state.copyWith(isError: false, isLoading: true));
      // get data
      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      // transform data\
      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingMoviesList: [],
              tenseDramasMovieList: [],
              southIndianMovieList: [],
              trendingTvList: [],
              isLoading: false,
              isError: true);
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          final trending = resp.results;
          final dramas = resp.results;
          final southIndian = resp.results;
          pastYear?.shuffle();
          trending?.shuffle();
          dramas?.shuffle();
          southIndian?.shuffle();
          return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: pastYear!,
              trendingMoviesList: trending!,
              tenseDramasMovieList: dramas!,
              southIndianMovieList: southIndian!,
              trendingTvList: state.trendingTvList,
              isLoading: false,
              isError: false);
        },
      );

// send to UI
      emit(_state1);

      final _state2 = _tvResult.fold(
        (MainFailure failure) {
          return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingMoviesList: [],
              tenseDramasMovieList: [],
              southIndianMovieList: [],
              trendingTvList: [],
              isLoading: false,
              isError: true);
        },
        (HotAndNewResp resp) {
          final topTenList = resp.results;
          return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: state.pastYearMovieList,
              trendingMoviesList: topTenList!,
              tenseDramasMovieList: state.tenseDramasMovieList,
              southIndianMovieList: state.southIndianMovieList,
              trendingTvList: topTenList,
              isLoading: false,
              isError: true);
        },
      );

      //  send to UI
      emit(_state2);
    });
  }
}
