import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cat_breeds/src/features/cat/data/models/breed_model.dart';
import 'package:cat_breeds/src/features/cat/domain/use_cases/cat_use_case.dart';
import 'package:equatable/equatable.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit({required CatUseCase catUseCase})
      : _catUseCase = catUseCase,
        super(const CatState());

  final CatUseCase _catUseCase;
  Timer? _debounceTimer;


  void init() {
    getBreeds();
  }

  void getBreeds({ String search = "" }) async {
    emit(state.copyWith(state: StateEnum.loading));
    try{
      final breeds = await _catUseCase.getBreeds(search);
      emit(state.copyWith(state: StateEnum.success, breeds: breeds));
    }catch(e){
      emit(state.copyWith(state: StateEnum.error));
    }
  }

  void searchBreeds(String search) {
    _delayFunction(500, () {
      getBreeds(search: search);
    });
  }

  Future<void> _delayFunction(int seconds, Function function) async {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(Duration(milliseconds: seconds), () {
      function();
    });
  }

}
