import 'package:flutter/material.dart';
import 'package:next_top_tech/core/common/widgets/main_card_widget.dart';
import 'package:next_top_tech/src/news_list/domain/entities/article.dart';
import 'package:next_top_tech/src/news_list/presentataion/widgets/news_tag.dart';

class NewsItemContainer extends StatelessWidget {
  const NewsItemContainer({required this.item, super.key});

  final Article item;

  @override
  Widget build(BuildContext context) {
    return MainCardWidget(
      child: Column(
        children: [
          ListTile(
            title: Text(item.title),
            subtitle: Text(item.description),
          ),
          NewsTag(label: item.mainSource),
        ],
      ),
    );
  }
}
