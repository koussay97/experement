import 'package:dartz/dartz.dart';

import '../entites/entities_export.dart';

abstract interface class IConcentratorApiRepository{

  /// this will load all of the tables
  /// we need this to populate the tables dropdown
  /// todo : ask Mario
  Future<Either<ServerFailure,List<ConcentratorTableDto>>> fetchAllTablesNames({required String firmwareVersion, required String port});

  /// this will fetch one table from ...
  /// by id,
  Future<Either<ServerFailure,ConcentratorTableData>> fetchSingleTable({required String id, required String port});


  /// if we are connected to the concentrator,
  /// we will fetch the exact value of
  /// the cell
 Future<Either<ServerFailure,ConcentratorCellData>> getConcentratorCellLiveData({required CommunicationRequest body,required String port });


  /// we will use this to update the cell data in the server
  Future<Either<ServerFailure,ConcentratorCellData>> writeToCell({required CommunicationRequest body,required String port });
}



