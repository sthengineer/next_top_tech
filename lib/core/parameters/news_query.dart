import 'package:equatable/equatable.dart';

class NewsQuery extends Equatable {
  const NewsQuery({
    required this.query,
    required this.page,
  });
  const NewsQuery.empty()
      : this(
    query: '',
    page: '',
  );

  final String query;
  final String page;

  @override
  List<Object?> get props => [
        query,
        page,
      ];
}
