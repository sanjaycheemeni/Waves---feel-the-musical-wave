import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:waves/model/search_result.dart';
import 'package:waves/services/musicService.dart';

class PlayerProvider extends ChangeNotifier {
  late AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  double _currentValue = 0.0;

  bool isPrevAvailable = false;
  bool isNextAvailable = false;

  List<SongSearch> songs = [];
  int song_index = -1;

  String _id = '';
  String _title = '';
  String _description = '';
  String _audioURL = '';
  String _imageURL = '';
  late SongSearch song;

  double get currentValue
  //  => _currentValue;

  {
    // print(_currentValue.toString() + '####');
    if (songs.length < 0) {
      fetchrecmSongs();
      updateNextAndPrev();
    }
    if (_currentValue > 1) {
      playNextSong();
      return 1;
    }
    return _currentValue;
  }

  String get title => _title;
  String get description => _description;
  String get audioURL => _audioURL;
  String get imageURL => _imageURL;
  bool get isPlaying => _audioPlayer.playing;

  PlayerProvider() {
    _audioPlayer = AudioPlayer();
    fetchrecmSongs();
  }

  Future<void> _setupAudioPlayer(String audioURL) async {
    _audioURL = audioURL;
    final audioSource = AudioSource.uri(Uri.parse(audioURL));
    _duration = (await _audioPlayer.setAudioSource(audioSource))!;
    _audioPlayer.positionStream.listen((position) {
      _currentValue = position.inMilliseconds / _duration.inMilliseconds;
      // playPause();
      notifyListeners();
      // print((currentValue * 100).toString() + ' ##');
    });
  }

  void setMetadata(
      {required String title,
      required String description,
      required String audioURL,
      required String imageURL,
      required String id,
      required SongSearch song}) {
    if (_audioURL != audioURL) {
      _title = title;
      _id = id;
      _description = description;
      _audioURL = audioURL;
      _imageURL = imageURL;
      this.song = song;
      _setupAudioPlayer(audioURL);
    }
    fetchrecmSongs();

    notifyListeners();
  }

  playNextSong() {
    print(song_index.toString() + '###' + songs.length.toString());
    if (songs.length > 0 && song_index < songs.length - 1) {
      song_index++;

      _setupAudioPlayer(songs[song_index].downloadUrl[3].url);
      _title = songs[song_index].name;
      _description = songs[song_index].album.name.toString();
      _imageURL = songs[song_index].image[2].url;
      if (song_index == songs.length - 2) {
        _id = songs[songs.length].id;
        song_index = -1;
        fetchrecmSongs();
      }
    } else {
      if (songs.length != 0) {
        _id = songs[songs.length - 1].id;
        //   song_index = -1;
      }
      fetchrecmSongs();
    }
    updateNextAndPrev();
  }

  playPrevSong() {
    print(song_index.toString() + '###' + songs.length.toString());
    if (songs.length < 0) fetchrecmSongs();
    if (songs.length > 0 && song_index > 0) {
      song_index--;
      _setupAudioPlayer(songs[song_index].downloadUrl[3].url);
      _title = songs[song_index].name;
      _description = songs[song_index].album.name.toString();
      _imageURL = songs[song_index].image[2].url;
      updateNextAndPrev();
    }

    updateNextAndPrev();
  }

  void seekToPosition(double value) {
    _audioPlayer.seek(
        Duration(milliseconds: (_duration.inMilliseconds * value).round()));
  }

  void playPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    Future.delayed(Duration.zero, () => notifyListeners());
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void fetchrecmSongs() async {
    print(_id);
    // songs.addAll(await MusicService().getRecommendedSongs(_id));
    if (songs.length < 1) {
      songs = await MusicService().getRecommendedSongs(_id);
    } else {
      print('##########');
      addRecommendedSongsAndRemoveDuplicates(
          await MusicService().getRecommendedSongs(_id));
    }

    print(songs.length.toString() + 'songlist   ');
    updateNextAndPrev();
  }

  void addRecommendedSongsAndRemoveDuplicates(
      List<SongSearch> recommendedSongs) {
    final existingSongIds = songs.map((song) => song.id).toSet();

    final newSongs = recommendedSongs
        .where((song) => !existingSongIds.contains(song.id))
        .toList();
    if (newSongs.length > 1) {
      _id = songs[songs.length - 4].id;
      fetchrecmSongs();
    }

    songs.addAll(newSongs);
    updateNextAndPrev();
  }

  updateNextAndPrev() {
    isNextAvailable = false;
    isPrevAvailable = false;
    if (songs.length > song_index) {
      isNextAvailable = true;
    }
    if (song_index > 0) isPrevAvailable = true;
  }
}
