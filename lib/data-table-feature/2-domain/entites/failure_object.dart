import 'package:equatable/equatable.dart';

sealed class Failures extends Equatable{
 final String error;
 final  String statusCode;
 final  String stackTrace;

 const Failures({required this.error, required this.stackTrace, required this.statusCode});

}

class ServerFailure extends Failures{
 const ServerFailure({required super.error, required super.stackTrace, required super.statusCode});

  @override
  List<Object?> get props => [statusCode,error];

}