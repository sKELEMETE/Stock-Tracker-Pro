import 'package:hive/hive.dart';
part 'watchlist_item.g.dart';

@HiveType(typeId: 0)
class WatchlistItem extends HiveObject {
  @HiveField(0)
  String symbol;

  @HiveField(1)
  String name;

  WatchlistItem({required this.symbol, required this.name});
}
