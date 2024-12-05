import 'package:equatable/equatable.dart';

import '../../../data/models/worker.dart';

class ForemanPageState extends Equatable{

  final List<Worker> workers;

  const ForemanPageState({this.workers = const []});
  
  @override
  List<Object?> get props => [workers];
}