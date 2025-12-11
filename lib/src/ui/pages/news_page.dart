import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/news/news_bloc.dart';
import '../../blocs/news/news_event.dart';
import '../../blocs/news/news_state.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NewsLoaded) {
          final items = state.articles;
          if (items.isEmpty)
            return const Center(child: Text('No news available'));
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) => NewsCard(article: items[i]),
          );
        }
        if (state is NewsError)
          return Center(child: Text('Error: ${state.message}'));
        return const SizedBox.shrink();
      },
    );
  }
}
