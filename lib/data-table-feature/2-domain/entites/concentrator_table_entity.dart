import 'package:equatable/equatable.dart';
import 'package:experimenting_with_pluto/data-table-feature/2-domain/entites/concentrator_table_cell_entity.dart';

class ConcentratorTableData extends Equatable{
  final int id;
  final String acronym;
  final String name;
  final int rows;
  final String firmware;
  final String tableId;
  final int tableNumber;
  final List<ConcentratorCellData> fields;

  const  ConcentratorTableData({
    required this.rows,
    required this.acronym,
    required this.fields,
    required this.firmware,
    required this.tableId,
    required this.tableNumber,
    required this.id,
    required this.name,
  });

  @override

  List<Object?> get props => [id];
}