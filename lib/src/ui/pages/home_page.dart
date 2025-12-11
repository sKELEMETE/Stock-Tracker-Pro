import 'package:flutter/material.dart';
import 'watchlist_page.dart';
import 'news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stock Tracker Pro'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Watchlist'),
              Tab(text: 'News'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WatchlistPage(),
            NewsPage(),
          ],
        ),
      ),
    );
  }
}
