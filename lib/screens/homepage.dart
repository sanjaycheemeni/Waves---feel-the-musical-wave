import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:waves/provider/player_provider.dart';
import 'package:waves/screens/music_player_page.dart';
import 'package:waves/widgets/global_search_tile.dart';
import 'package:waves/widgets/music_progress_bar.dart';

import '../provider/search_provider.dart';
import '../widgets/search_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    final ScreenDimension = MediaQuery.of(context).size;
    final audioPlayer = Provider.of<PlayerProvider>(context);
    searchProvider.initializeFromStorage();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Waves',
                        style: TextStyle(
                            color: Color(0xFF313292),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Feel the music wave!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 101, 102, 160),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SearchBox(
                      hint: 'Search song,artist,album..',
                      onTextChanged: (text) {
                        print(text);
                        searchProvider.fetchSongsByQuery(text);
                      },
                      ScreenDimension: MediaQuery.of(context).size,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Consumer<SearchProvider>(
                        builder: (buildcontext, state, context) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (buildContext, index) =>
                              GlobalSearchItem(
                            data: state.songList[index],
                            ScreenDimension: ScreenDimension,
                          ),
                          itemCount: state.songList.length,
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
            if (audioPlayer.title != '')
              MusicProgressBar(ScreenDimension: ScreenDimension),
          ],
        ),
      ),
    );
  }
}
