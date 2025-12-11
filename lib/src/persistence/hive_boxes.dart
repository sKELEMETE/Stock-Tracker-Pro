import 'package:hive/hive.dart';
import '../models/watchlist_item.dart';

const kWatchlistBox = 'watchlist_box';

Future<void> registerAdapters() async {
  Hive.registerAdapter(WatchlistItemAdapter());
}

Future<void> openBoxes() async {
  await Hive.openBox<WatchlistItem>(kWatchlistBox);
}
