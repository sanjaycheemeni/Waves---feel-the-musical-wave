import 'dart:convert';

import 'package:waves/model/player.dart';
import 'package:waves/model/song.dart';

import '../model/search_result.dart';
import '../util/constants.dart';
import 'package:http/http.dart' as http;

class MusicService {
  Future<List<Song>> globalSearch(String query) async {
    final url = Uri.parse(GLOBAL_SEARCH + '?query=' + query);

    print(url);
    try {
      final response = await http.get(url, headers: {'Host': 'saavn.dev'});

      final data = jsonDecode(response.body)['data']['songs']['results'];

      List<Song> songList =
          List<Song>.from(data.map((song) => Song.fromJson(song)));

      return songList;
    } catch (error) {
      // Handle other exceptions
      print(error);
      throw Exception('Failed to send request:${error}');
    }
    return [];
  }

  Future<List<SongSearch>> songSearch(String query) async {
    final url = Uri.parse(SONG_SEARCH + '?query=' + query);

    print(url);
    try {
      final response = await http.get(
        url,
      );
      print('#### ${response.body}');

      final data = jsonDecode(response.body)['data']['results'];
      print('${data}  ##');

      List<SongSearch> songList =
          List<SongSearch>.from(data.map((song) => SongSearch.fromJson(song)));

      return songList;
    } catch (error) {
      // Handle other exceptions
      print(error);
      throw Exception('Failed to send request:${error}');
    }
    return [];
  }

  Future<Player> getSong(String musicId) async {
    final url = Uri.parse(GET_SONG + musicId);

    print(url);
    try {
      final response = await http.get(
        url,
      );

      print('#-' + response.body);

      // List<SongSearch> songList =
      //     List<SongSearch>.from(data.map((song) => SongSearch.fromJson(song)));

      // return songList;
    } catch (error) {
      // Handle other exceptions
      print(error);
      throw Exception('Failed to send request:${error}');
    }
    return Player();
  }

  Future<List<SongSearch>> getRecommendedSongs(id) async {
    final url = Uri.parse(RECOM_SONG + id + '/suggestions');

    print(url.toString() + '##');
    try {
      final response = await http.get(
        url,
      );
      print('#### ${jsonDecode(response.body)['data']}');

      final data = jsonDecode(response.body)['data'];

      // print('${data}  ##');

      List<SongSearch> songList =
          List<SongSearch>.from(data.map((song) => SongSearch.fromJson(song)));

      return songList;
    } catch (error) {
      // Handle other exceptions
      return [];
      print(error);
      throw Exception('Failed to send request:${error}');
    }
    return [];
  }
}
