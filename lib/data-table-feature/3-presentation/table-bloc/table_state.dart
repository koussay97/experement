part of 'table_bloc.dart';

sealed class TableState extends Equatable {
  const TableState();
}

final class TableInitialState extends TableState {
  @override
  List<Object> get props => [];
}

class CellSelectionState extends TableState {
  final List<ConcentratorCellData> selectedCells;

  const CellSelectionState({required this.selectedCells});

  @override
  List<Object> get props => [selectedCells];
}

class EditCellValuesState extends TableState {
  final ConcentratorCellData cell;

  const EditCellValuesState({ required this.cell});

  @override
  List<Object> get props => [ cell];
}

class CopyCellsState extends TableState {
  final List<ConcentratorCellData> copiedCells;

  const CopyCellsState({required this.copiedCells});

  @override
  List<Object> get props => [copiedCells];
}

class PastCellsState extends TableState {
  final List<ConcentratorCellData> toBePastedCells;

  const PastCellsState({required this.toBePastedCells});

  @override
  List<Object> get props => [toBePastedCells];
}

class UndoChangesState extends TableState {
  final bool undoAll;

  const UndoChangesState({required this.undoAll});

  @override
  List<Object> get props => [undoAll];
}

class SwitchBetweenHrAndHexState extends TableState {
  final bool toHexResult;

  const SwitchBetweenHrAndHexState({required this.toHexResult});

  @override
  List<Object> get props => [toHexResult];
}

class ExpandCellsState extends TableState {
  final bool expandResult;

  const ExpandCellsState({required this.expandResult});

  @override
  List<Object> get props => [expandResult];
}

class CellErrorState extends TableState {
  final String message;
  final String? stackTrace;

  const CellErrorState({required this.message, this.stackTrace});

  @override
  List<Object> get props => [message];
}
class GenericState extends TableState{
  @override
  List<Object?> get props => throw UnimplementedError();

}