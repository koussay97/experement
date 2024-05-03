import 'package:equatable/equatable.dart';

class ConcentratorTableDto extends Equatable{
  final String tableName;
  final String tableAcronym;
  final String tableId;

  const ConcentratorTableDto(
      {required this.tableId,
      required this.tableAcronym,
      required this.tableName});

  @override
  // TODO: implement props
  List<Object?> get props => [tableId];
}
