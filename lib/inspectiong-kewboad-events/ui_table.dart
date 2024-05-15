import 'dart:html';

import 'package:experimenting_with_pluto/inspectiong-kewboad-events/data_grid_source.dart';
import 'package:experimenting_with_pluto/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Experiment extends StatefulWidget {
  const Experiment({super.key});

  @override
  State<Experiment> createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  late TextEditingController cot;
  late final List<Employee> _employees;
 late final FocusNode focusNode;
  late final EmployeeDataSource _employeeDataSource;
  DataGridController tableController = DataGridController();

  @override
  void initState() {
    focusNode = FocusNode();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(employees: _employees);
    tableController = DataGridController(
      selectedIndex: 0,
      selectedRow: _employeeDataSource.rows[0],
    )..addListener(tableControllerListener);
    //initTableListener();
    super.initState();
  }

  void initTableListener() {
    // works only once
    /// the reason is that [DataGridController] does not extend value notifier
    /// it extends Change notifier
    /// means it does not emit events to listen to them
    /// also means, we have to use the callbacks rather than relying on the listener
    if (tableController.hasListeners) {
      tableController.notifyListeners();
    } else {
      print("no listener is attached");
    }
  }

  void tableControllerListener() {
    print("listener active");
    //print("current cell selected ::: ${tableController.currentCell}");
    print(
        "current rows idexes selected ::: ${tableController.selectedRows.indexed.toList()}");
    print("current rows selected ::: ${tableController.selectedRows}");
  }

  @override
  void dispose() {
    tableController.removeListener(tableControllerListener);
    tableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              child: const Text('Update cell value'),
              onPressed: () {
                _employees[0].salary = 9000;
                _employeeDataSource.dataGridRows[0] = DataGridRow(cells: [
                  DataGridCell(value: _employees[0].id, columnName: 'id'),
                  DataGridCell(value: _employees[0].name, columnName: 'name'),
                  DataGridCell(
                      value: _employees[0].designation,
                      columnName: 'designation'),
                  DataGridCell(
                      value: _employees[0].salary, columnName: 'salary'),
                ]);

                _employeeDataSource.updateDataGridSource(
                    rowColumnIndex: RowColumnIndex(0, 3));
              }),

          KeyboardListener(
            autofocus: true,
            includeSemantics: true,
            focusNode: focusNode,
            onKeyEvent: ( event){
             final pressedCtrl =HardwareKeyboard.instance.isControlPressed;
             final pressedS=HardwareKeyboard.instance.isPhysicalKeyPressed(PhysicalKeyboardKey.keyS);
              if (pressedCtrl && pressedS) {
                // Handle Ctrl+S key combination
                print("Ctrl+S pressed");
                // Prevent the default action for the key combination
                tableController.selectedRows=[];

              }
              print("o hooh ");
            print(event);

            },
            child: SfDataGrid(
                //columnSizer: ColumnSizer(),

                //  allowFiltering: true,
                allowMultiColumnSorting: true,
                allowEditing: true,
                allowColumnsDragging: true,
                allowTriStateSorting: true,
                // footerFrozenColumnsCount: 3,
                // footerFrozenRowsCount: 3,

                onSelectionChanging: (elementsToBeAdded, elementsToBeRemoved) {
                  //   print(elementsToBeAdded.iterator.current);
                  //  print(elementsToBeRemoved.iterator.current);
                  print(
                      "selected rows from controller ::${tableController.selectedRows}");
                  return true;
                },
                editingGestureType: EditingGestureType.doubleTap,
                gridLinesVisibility: GridLinesVisibility.both,
                onCellDoubleTap: (details) {
                  // tableController.beginEdit(details.rowColumnIndex);
                  //    tableController.selectedRows.add(_employeeDataSource.dataGridRows[details.rowColumnIndex.rowIndex]);
                  //
                  // print(tableController.selectedRows);
                },
                allowSorting: true,
                headerGridLinesVisibility: GridLinesVisibility.both,
                highlightRowOnHover: true,
                checkboxColumnSettings: const DataGridCheckboxColumnSettings(
                    showCheckboxOnHeader: true,
                    width: 50,
                    backgroundColor: Colors.teal,
                    label: Text("check me")),
                allowSwiping: true,
                footer: Container(
                  color: Colors.teal,
                  height: 20,
                ),
                shrinkWrapColumns: false,
                columnResizeMode: ColumnResizeMode.onResize,
                allowExpandCollapseGroup: true,
                allowPullToRefresh: true,
                autoExpandGroups: true,
                shrinkWrapRows: false,
                //selectionMode: SelectionMode.single,
                selectionMode: SelectionMode.multiple,
                navigationMode: GridNavigationMode.cell,
                controller: tableController,
             /*   selectionManager: OurSelectionManagerEx(
                     controller: tableController,
                    callBack: (KeyEvent keyBoardEvent) {
                  return keyBoardEvent;
                }),*/
                source: _employeeDataSource,
                allowColumnsResizing: true,
                onCellTap: (a) {
                  //  print("tapped cell");

                  //tableController.currentCell=a;
                  /*             tableController.moveCurrentCellTo(a.rowColumnIndex);
                print(tableController.currentCell);*/
                },
                onSelectionChanged: (a, b) {
                  print(
                      "selected rows from controller ::${tableController.selectedRows}");
                },
                columns: [
                  GridColumn(
                      autoFitPadding: EdgeInsets.zero,
                      allowEditing: true,
                      allowSorting: true,
                      visible: true,
                      columnName: 'id',
                      label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'ID',
                            overflow: TextOverflow.ellipsis,
                          ))),
                  GridColumn(
                      columnName: 'name',
                      label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Name',
                            overflow: TextOverflow.ellipsis,
                          ))),
                  GridColumn(
                      columnName: 'designation',
                      label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Designation',
                            overflow: TextOverflow.ellipsis,
                          ))),
                  GridColumn(
                      columnName: 'salary',
                      label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Salary',
                            overflow: TextOverflow.ellipsis,
                          ))),
                ]),
          ),

          //  Text("oy :: ${tableController.currentCell}"),
        ],
      ),
    );
  }
}

class OurSelectionManagerEx extends SelectionManagerBase {
  final DataGridController controller;
  final Function(KeyEvent) callBack;

  OurSelectionManagerEx(
      {
       required this.controller,
      required this.callBack});

  @override
  void handleDataGridSourceChanges() {

    super.handleDataGridSourceChanges();
  }

  /// here

  @override
  void handleKeyEvent(KeyEvent keyEvent) {
    if (keyEvent.logicalKey == LogicalKeyboardKey.arrowUp) {
      callBack.call(keyEvent);
      print(keyEvent.logicalKey);
    }
    super.handleKeyEvent(keyEvent);
  }

  @override
  void onSelectedRowChanged() {
    super.onSelectedRowChanged();
  }



  @override
  void onSelectedIndexChanged() {
    super.onSelectedIndexChanged();
  }

  @override
  void onGridSelectionModeChanged() {
    super.onGridSelectionModeChanged();
  }

  @override
  void handleTap(RowColumnIndex rowColumnIndex) {
    super.handleTap(rowColumnIndex);
  }
}
