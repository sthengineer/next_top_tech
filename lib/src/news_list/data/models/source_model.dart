import 'package:next_top_tech/core/utils/typedef.dart';
import 'package:next_top_tech/src/news_list/domain/entities/source.dart';

class SourceModel extends Source{

  const SourceModel({
    required super.id,
    required super.name,
  });

  factory SourceModel.fromJson(DataMap json) => SourceModel(
    id: json['id'],
    name: json['name'] as String,
  );

  DataMap toJson() => {
    'id': id,
    'name': name,
  };
}
