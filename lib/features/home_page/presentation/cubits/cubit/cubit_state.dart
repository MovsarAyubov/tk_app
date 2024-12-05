import 'package:equatable/equatable.dart';

class CubitState extends Equatable {
  final String role;

  const CubitState({this.role = ""});
  @override
  List<Object?> get props => [role];

  String get getRoleOne =>  "Бригадира"; 
  String get roleTwo => "Весовой"; 
}