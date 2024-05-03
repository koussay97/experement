import 'package:equatable/equatable.dart';

class HumanReadableData extends Equatable{

  final String value;
  final String desc;

  const HumanReadableData({
    required this.value ,
    required this.desc,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [value,desc];
}