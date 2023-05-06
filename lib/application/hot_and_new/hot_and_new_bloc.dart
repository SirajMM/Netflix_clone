// ignore_for_file: depend_on_referenced_packages, no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new_resp/hot_and_new_service.dart';
import '../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';
part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //  get hot and new data
    on<LoadDataInComingSoon>((event, emit) async {
      // send loading to ui
      emit(const HotAndNewState(
        commingSoonList: [],
        everyoneIsWatchingList: [],
        isLoading: true,
        isError: false,
      ));
      // get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();
      // data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
            commingSoonList: [],
            everyoneIsWatchingList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            commingSoonList: resp.results!,
            everyoneIsWatchingList: state.everyoneIsWatchingList,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(newState);
    });

// get hot and new tv data

    on<LoadDataInEveryoneIsWatching>((event, emit) async{
   // send loading to ui
      emit(const HotAndNewState(
        commingSoonList: [],
        everyoneIsWatchingList: [],
        isLoading: true,
        isError: false,
      ));
      // get data from remote
      final _result = await _hotAndNewService.getHotAndNewTvData();
      // data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
            commingSoonList: [],
            everyoneIsWatchingList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            commingSoonList: state.commingSoonList,
            everyoneIsWatchingList: resp.results!,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(newState);
    });
  }
}
