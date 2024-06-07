import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:waves/provider/player_provider.dart';
import 'package:waves/util/time.dart';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool isStarted = false;

  @override
  Widget build(BuildContext context) {
    final audioPlayer = Provider.of<PlayerProvider>(context);
    if (!isStarted && !audioPlayer.isPlaying) {
      audioPlayer.playPause();
      isStarted = true;
    }

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   centerTitle: true,
      //   title: Text('Waves'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/back_2.png',
            ),
            opacity: .4,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(audioPlayer.imageURL ??
                      'https://c.saavncdn.com/587/Gypsy-Girl-A-Cappella--English-2017-20191123100913-500x500.jpg'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                audioPlayer.title.toString(),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                audioPlayer.description.toString(),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Slider(
                value: context.watch<PlayerProvider>().currentValue,
                onChanged: (value) {
                  context.read<PlayerProvider>().seekToPosition(value);
                },
                min: 0.0,
                max: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatDuration(audioPlayer.song.duration),
                        style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                    Text(
                        setTimer(audioPlayer.song.duration,
                            audioPlayer.currentValue),
                        style: TextStyle(fontSize: 15.0, color: Colors.grey))
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      // Previous song logic
                      audioPlayer.playPrevSong();
                    },
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      color: (audioPlayer.isPrevAvailable)
                          ? Colors.black
                          : Colors.black26,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<PlayerProvider>().playPause();
                    },
                    icon: Icon(
                      context.watch<PlayerProvider>().isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Next song logic
                      audioPlayer.playNextSong();
                    },
                    icon: Icon(
                      Icons.skip_next_rounded,
                      color: (audioPlayer.isNextAvailable)
                          ? Colors.black
                          : Colors.black26,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
