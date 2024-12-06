import 'package:equatable/equatable.dart';

import '../../../data/models/worker.dart';

abstract class WorkersState extends Equatable{}

class SuccessState extends WorkersState{
  final List<Worker> workers;
  SuccessState({this.workers = const []});
  
  @override
  List<Object?> get props => [workers];
}

class ErrorState extends WorkersState {
  final String errorText;

  ErrorState(this.errorText);
  @override
  List<Object?> get props => [errorText];
}

class LoadingState extends WorkersState {
  final bool isLoaded;
  LoadingState({
    this.isLoaded = false,
  });
  @override
  List<Object?> get props => [isLoaded];
}