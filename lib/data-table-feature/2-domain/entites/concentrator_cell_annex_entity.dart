

import 'package:equatable/equatable.dart';
import 'package:experimenting_with_pluto/data-table-feature/2-domain/entites/concentrator_human_readable_entity.dart';

class CellPayloadAnnex extends Equatable{

  final int active;
  final List<dynamic> bits;
  final int bit;
  final int eBit;
  final String name;
  final String type;
  final List<HumanReadableData> payload;
  final  String maxValue;
  final String format;
  final String value;
  final String desc;

  const CellPayloadAnnex({
    required this.name,
    required this.bit,
    required this.bits,
    required this.type,
    required this.value,
    required this.active,
    required this.desc,
    required this.eBit,
    required this.format,
    required this.maxValue,
    required this.payload,
  });

  @override
  List<Object?> get props => [type,name,bit,bits];
}