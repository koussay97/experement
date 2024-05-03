import 'package:dartz/dartz.dart';
import 'package:experimenting_with_pluto/data-table-feature/2-domain/entites/concentrator_table_cell_entity.dart';

abstract interface class IUiTableConcentratorRepository{

  Either<Unit,ConcentratorCellData> editingCellValues({required String newVal, required ConcentratorCellData editableCell});

  /// todo : convert this into a stream return type and
  /// one [ConcentratorCellData] arg
  Either<Unit,Stream<ConcentratorCellData>>startSelectingCells({required ConcentratorCellData initialSelectionCell});

  // selectingCells({required List<ConcentratorCellData> selectedCell});

  Either<Unit,List<ConcentratorCellData>> copyingCell({required List<ConcentratorCellData> copiedCells});

  Either<Unit,List<ConcentratorCellData>>pastingCellValues({required List<ConcentratorCellData> copiedCells});

  Either<Unit,ConcentratorCellData> undoChanges({required bool undoAll});

  Either<Unit,bool> switchingBetweenHexToHR({required bool toHex});

  Either<Unit,bool> expandCellSideBar({required bool expand,});

}
