import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/domain/failures/failures.dart';
import 'package:flutter_clean/domain/usecases/advice_usecases.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  final AdviceUseCases adviceUseCases;
  AdviceBloc({required this.adviceUseCases}) : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceLoading());
      final failureOrAdvice = await adviceUseCases.getAdvice();
      failureOrAdvice.fold(
        (failure) => emit(AdviceError(message: _mapFailureToMessage(failure))),
        (advice) => emit(AdviceLoaded(advice: advice.advice)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Ops, API Error. Please try again!';
      case CacheFailure:
        return 'Ops, cache failed. Please try again!';
      default:
        return 'Ops, Something gone wrong. Please try again!';
    }
  }
}
