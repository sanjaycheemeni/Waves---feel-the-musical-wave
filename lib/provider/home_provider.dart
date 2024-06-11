import 'package:flutter/material.dart';
import 'package:waves/model/trending.dart';
import 'package:waves/services/musicService.dart';

class HomeProvider extends ChangeNotifier {
  List<Trending> TopTrends = [];

  // cons
  HomeProvider() {
    fetchTrending();
  }

  fetchTrending() async {
    TopTrends = await MusicService().getTrendingList();
    print('%% success${TopTrends}');
    notifyListeners();
  }

  // getter
  get getTrending => TopTrends;
}
