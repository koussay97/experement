import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:experimenting_with_pluto/data-table-feature/2-domain/repository/concentrator_ui_repository.dart';

import '../../2-domain/entites/entities_export.dart';

part 'table_event.dart';

part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  final IUiTableConcentratorRepository uiRepository;

  StreamSubscription<ConcentratorCellData>? sub;

  TableBloc({required this.uiRepository})
      : sub = null,
        super(TableInitialState()) {
    on<TableEvent>((event, emit) {
      if (event is EditCellValue) {
        cancelSub();
        final result = uiRepository.editingCellValues(
            newVal: event.newVal, editableCell: event.cell);
        result.fold(
          (l) => emit(GenericState()),
          (r) => emit(EditCellValuesState(
            cell: r,
          )),
        );
      }

      if (event is SelectCells) {
        final result = uiRepository.startSelectingCells(
            initialSelectionCell: event.selectionStartCell);
        result.fold((l) => emit(GenericState()), (r) {
          cancelSub();
          sub = r.listen((event) {});
        });
      }
      if (event is CopyCells) {
        cancelSub();

      }
      if (event is PastCells) {
        cancelSub();

      }
      if (event is UndoChanges) {
        cancelSub();

      }
      if (event is SwitchBetweenHrAndHex) {
        cancelSub();
      }
      if (event is ExpandCells) {
        cancelSub();

      }
    });
  }

  void cancelSub() {
    if(sub !=null){
      sub?.cancel();
      sub = null;
    }
  }

  @override
  Future<void> close() {
    cancelSub();
    return super.close();
  }
}
