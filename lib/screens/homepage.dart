import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:waves/provider/home_provider.dart';
import 'package:waves/provider/player_provider.dart';
import 'package:waves/screens/music_player_page.dart';
import 'package:waves/widgets/global_search_tile.dart';
import 'package:waves/widgets/music_progress_bar.dart';
import 'package:waves/widgets/trending_card.dart';

import '../provider/search_provider.dart';
import '../widgets/gradient_text.dart';
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
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: GradientText(
                        'Good Afternoon!',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                        gradient: LinearGradient(colors: [
                          Colors.blue.shade400,
                          Colors.blue.shade900,
                        ]),
                      ),
                    ),
                    SearchBox(
                        onTextChanged: (value) {},
                        ScreenDimension: ScreenDimension,
                        hint: 'Search..'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Text('Trendings'),
                    ),
                    Consumer<HomeProvider>(builder: (context, state, child) {
                      return SizedBox(
                        height: 200,
                        child: (state.TopTrends.length == 0)
                            ? Text('Loading...')
                            : Expanded(
                                child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (bc, index) {
                                  return TrendingCard(
                                      image: state.TopTrends[index].image,
                                      singtitle: state.TopTrends[index].name,
                                      desc: state.TopTrends[index].desc,
                                      index: index,
                                      type: state.TopTrends[index].type);
                                },
                                itemCount: state.TopTrends.length,
                              )),
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
