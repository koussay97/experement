import 'package:experimenting_with_pluto/inspectiong-kewboad-events/ui_table.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Experiment(),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  /// Creates the home page.
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Employee> employees = <Employee>[];
  //late EmployeeDataSource employeeDataSource;

  late DataGridController dataGridController;
  late TextEditingController textEditingController;
late EmployeeDataSource dataSource;
  @override
  void initState() {
    textEditingController = TextEditingController()..addListener(textListeners);
    //employees = getEmployeeData();
   dataSource = EmployeeDataSource(employeeData: employees, controller: textEditingController);



   */
/* employeeDataSource = EmployeeDataSource(
        employeeData: employees, controller: textEditingController);*//*

    dataGridController = DataGridController(selectedIndex: 0,selectedRow: dataSource.rows.first)
      ..addListener(dataListeners);
    textEditingController = TextEditingController()..addListener(textListeners);
    super.initState();
  }

  void textListeners() {
    // modify the edited element of list
    // print("text editing controller value ${textEditingController.text}");
    if (textEditingController.text.isNotEmpty) {}
  }

  void dataListeners() {
    // whenever

    print("current cell :: ${dataGridController.currentCell}");
    print(
        "current horizontal offset :: ${dataGridController.horizontalOffset}");
    print("current selectedIndex :: ${dataGridController.selectedIndex}");
    print("current vertical offset :: ${dataGridController.verticalOffset}");
    print(
        "current cell being editted :::: ${dataGridController.isCurrentCellInEditing}");
  }

  @override
  void dispose() {
    textEditingController.removeListener(textListeners);
    dataGridController.removeListener(dataListeners);

    textEditingController.dispose();
    dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    // moving with arrows
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: SfDataGrid(
        //allowEditing: true,
        onCellDoubleTap: (a){
             print(a);
        },
        onCellLongPress: (e){

        },
      //  onQueryRowHeight: ,
        onSelectionChanged: (e,r){
          print("onSelectionChanged :${e} ${r}");
        },
       onCellTap: (e){
          print("on cell tap ::: ${e.rowColumnIndex}");
       },
       // allowSorting: true,
        selectionManager: CustomSelectionManager(
        callbackFunction: (key){
          // do magic
          print(key);
          if(dataGridController.selectedRow != null){
            if(key.logicalKey.debugName=="Arrow Up"){
              dataGridController.selectedRow;
              dataGridController.moveCurrentCellTo(RowColumnIndex(
                  dataGridController.currentCell.rowIndex-1,
                  dataGridController.currentCell.columnIndex
                  ));
            }

          }else{
            print ("nth");
          }

        }
        ),
       // allowColumnsDragging: true,
        autoExpandGroups: true,
       // allowColumnsResizing: true,
        columnWidthMode: ColumnWidthMode.auto,
        //selectionMode: SelectionMode.single,
        navigationMode: GridNavigationMode.cell,

        source: dataSource,
        selectionMode: SelectionMode.multiple,


        controller: dataGridController,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'id',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'ID',
                  ))),
          GridColumn(
              columnName: 'name',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Name'))),
          GridColumn(
              columnName: 'designation',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Designation',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(

              columnName: 'salary',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Salary'))),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  final TextEditingController controller;
  List<DataGridRow> _employeeData = [];

  EmployeeDataSource(
      {required List<Employee> employeeData, required this.controller}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id,),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(

       // color: Colors.amber,
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: */
/*TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: e.value.toString(),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),*//*

            Text(e.value.toString()),
          );
        }).toList());
  }
}

class CustomSelectionManager extends SelectionManagerBase {
  Function(KeyEvent) callbackFunction;
  CustomSelectionManager({required this.callbackFunction});

  @override
  void handleKeyEvent(KeyEvent keyEvent) {
    callbackFunction.call(keyEvent);
    //print("keyEvent ::: ${keyEvent.character}");
    //print("keyEvent ::: ${keyEvent.deviceType}");
    //print("keyEvent ::: ${keyEvent.physicalKey}");
    //print("keyEvent ::: logicalKey ${keyEvent.logicalKey}");
    //print("keyEvent ::: synthesized ${keyEvent.synthesized}");
   // print("keyEvent ::: ${keyEvent.timeStamp}");
  }

}
*/
