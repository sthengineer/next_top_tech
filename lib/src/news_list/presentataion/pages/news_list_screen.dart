import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_top_tech/core/common/views/loading_view.dart';
import 'package:next_top_tech/core/common/widgets/primary_error_widget.dart';
import 'package:next_top_tech/core/extensions/context_extension.dart';
import 'package:next_top_tech/core/parameters/news_query.dart';
import 'package:next_top_tech/core/utils/constants.dart';
import 'package:next_top_tech/src/news_list/presentataion/bloc/news_list_bloc.dart';
import 'package:next_top_tech/src/news_list/presentataion/widgets/news_item_container.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  static const String routeName = '/news_list';

  @override
  Widget build(BuildContext context) {
    void request() {
      print('reload');
      context.read<NewsListBloc>().add(
            const GetNewsEvent(
              newsQuery: [
                NewsQuery(page: '1', query: kApple),
                NewsQuery(page: '1', query: kMicrosoft),
                NewsQuery(page: '1', query: kTesla),
                NewsQuery(page: '1', query: kGoogle),
              ],
            ),
          );
    }

    request();

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<NewsListBloc, NewsListState>(
          builder: (context, state) {
            return state is GettingNews
                ? const LoadingView()
                : state is ServiceError
                    ? PrimaryErrorWidget(
                        errorMassage: state.massage,
                        onPress: request,
                      )
                    : state is NewsLoaded
                        ? state.articleResponse.isEmpty
                            ? Center(
                                child: PrimaryErrorWidget(
                                  errorMassage: context.l.noNews,
                                ),
                              )
                            : ListView.builder(
                                itemCount: state.articleResponse.length,
                                itemBuilder: (context, index) {
                                  return NewsItemContainer(
                                    item: state.articleResponse[index],
                                  );
                                },
                              )
                        : const SizedBox.shrink();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
