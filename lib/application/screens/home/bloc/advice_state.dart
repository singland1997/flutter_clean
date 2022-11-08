part of 'advice_bloc.dart';

@immutable
abstract class AdviceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdviceInitial extends AdviceState {}

class AdviceLoading extends AdviceState {}

class AdviceLoaded extends AdviceState {
  final String advice;
  AdviceLoaded({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdviceError extends AdviceState {
  final String message;
  AdviceError({required this.message});

  @override
  List<Object?> get props => [message];
}
