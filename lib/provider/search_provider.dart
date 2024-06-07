import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:waves/model/search_result.dart';
import 'package:waves/model/song.dart';
import 'package:waves/services/musicService.dart';

class SearchProvider extends ChangeNotifier {
  var _songList = [];
  final _storage = GetStorage();

  SearchProvider() {
    print('object');
    initializeFromStorage();
  }

  // GETTERS
  get songList => _songList;

  // SETTERS
  void setSongList(List<SongSearch> newSongs) => _songList = newSongs;

  // INITIALIZATION
  void initializeFromStorage() async {
    await GetStorage.init();
    try {
      final stor = await GetStorage();
      final storedSongListMaps =
          await _storage.read<List<dynamic>>('SEARCH') ?? [];
      final storedSongList = await storedSongListMaps
          .map((songMap) => SongSearch.fromJson(songMap))
          .toList();
      print('#' + storedSongListMaps.toString());
      setSongList(storedSongList);
      notifyListeners();
    } catch (e) {
      print('ER#: ${e}');
    }
  }

  // METHODS
  Future<void> fetchSongsByQuery(String query) async {
    try {
      final fetchedSongs = await MusicService().songSearch(query);
      setSongList(fetchedSongs);
      notifyListeners();

      // Convert the _songList to a list of maps
      final songListMaps = _songList.map((song) => song.toJson()).toList();

      // Write the list of maps to storage
      GetStorage().write('SEARCH', songListMaps);
      // GetStorage().wr`ite('k', 'hello');

      // initializeFromStorage();
    } catch (e) {
      print('[`fetchSongsByQuery`]: ${e}');
    }
  }
}
