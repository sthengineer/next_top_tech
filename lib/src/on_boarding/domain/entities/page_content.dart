import 'package:equatable/equatable.dart';

import 'package:next_top_tech/core/res/media_res.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.title,
    required this.image,
  });


  const PageContent.introPageOne({required String title})
      : this(
          image: MediaRes.introPageTwo,
          title: title,
        );

  const PageContent.introPageTwo({required String title})
      : this(
          image: MediaRes.introPageOne,
          title: title,
        );

  final String image;
  final String title;

  @override
  List<Object?> get props => [image, title];
}
