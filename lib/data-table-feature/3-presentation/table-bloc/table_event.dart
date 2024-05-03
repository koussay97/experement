part of 'table_bloc.dart';

sealed class TableEvent extends Equatable {
  const TableEvent();
}

class EditCellValue extends TableEvent {
  final String newVal;
  final ConcentratorCellData cell;

  const EditCellValue({required this.newVal, required this.cell});

  @override
  List<Object?> get props => [newVal, cell];
}

class SelectCells extends TableEvent {
  // final List<ConcentratorCellData> listOfCellsToSelect;
  final ConcentratorCellData selectionStartCell;
  const SelectCells({required this.selectionStartCell});

  @override
  List<Object?> get props => [selectionStartCell];
}

class CopyCells extends TableEvent {
  final List<ConcentratorCellData> listOfCellsToSelect;

  const CopyCells({required this.listOfCellsToSelect});

  @override
  List<Object?> get props => [listOfCellsToSelect];
}

class PastCells extends TableEvent {
  final List<ConcentratorCellData> listOfCellsToSelect;

  const PastCells({required this.listOfCellsToSelect});

  @override
  List<Object?> get props => [listOfCellsToSelect];
}

class UndoChanges extends TableEvent {
  final bool undoAll;

  const UndoChanges({required this.undoAll});

  @override
  List<Object> get props => [undoAll];
}

class SwitchBetweenHrAndHex extends TableEvent {
  final bool toHex;

  const SwitchBetweenHrAndHex({required this.toHex});

  @override
  List<Object> get props => [toHex];
}

class ExpandCells extends TableEvent {
  final bool expand;

  const ExpandCells({required this.expand});

  @override
  List<Object> get props => [expand];
}
