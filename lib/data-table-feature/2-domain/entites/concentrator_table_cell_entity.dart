import 'package:equatable/equatable.dart';
import 'package:experimenting_with_pluto/data-table-feature/2-domain/entites/concentrator_cell_annex_entity.dart';

class ConcentratorCellData extends Equatable {
  final int pos;
  final String id;
  final int size;
  final String name;
  final String desc;
  final String access;
  final String type;
  final List<CellPayloadAnnex> payload;
  final String defValue;

  /// default
  final String minValue;
  final String maxValue;
  final String unit;

  /// if we need more than 2 values in the history
  /// we might need caching !
  final String alterValue;

  /// holds the newest version of the value
  final String previousValue;

  /// holds the previous state

  const ConcentratorCellData({
    this.alterValue = "",
    this.previousValue = "",
    required this.pos,
    required this.id,
    required this.size,
    required this.name,
    required this.desc,
    required this.access,
    required this.type,
    required this.payload,
    required this.defValue,
    required this.minValue,
    required this.maxValue,
    required this.unit,
  });

  ConcentratorCellData copyWith({
    int? pos,
    String? id,
    int? size,
    String? name,
    String? desc,
    String? access,
    String? type,
    List<CellPayloadAnnex>? payload,
    String? defValue,
    String? minValue,
    String? maxValue,
    String? unit,
    String? previousValue,
    String? alterValue,
  }) {
    return ConcentratorCellData(
      access: access ?? this.access,
      defValue: defValue ?? this.defValue,
      desc: desc ?? this.desc,
      id: this.id,
      maxValue: this.maxValue,
      minValue: this.minValue,
      name: name ?? this.name,
      payload: payload ?? this.payload,
      pos: pos ?? this.pos,
      size: size ?? this.size,
      type: type ?? this.type,
      unit: unit ?? this.unit,
      alterValue: alterValue ?? this.alterValue,
      previousValue: previousValue ?? this.previousValue,
    );
  }

  factory ConcentratorCellData.empty() => const ConcentratorCellData(
      unit: "",
      type: "",
      size: 2,
      pos: 2,
      payload: [],
      name: "",
      minValue: "",
      maxValue: "",
      id: "123",
      desc: "wxc",
      defValue: "0000000",
      access: "",
      previousValue: "",
      alterValue: "");

  @override
  List<Object?> get props => [id];
}


