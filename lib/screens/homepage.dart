import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
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
                        'Hello, Sanju',
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w300),
                        gradient: LinearGradient(colors: [
                          Colors.blue,
                          Color.fromARGB(255, 74, 85, 148),
                          Color.fromARGB(255, 134, 95, 240),
                          Color.fromARGB(255, 137, 105, 226),
                          // Color.fromARGB(255, 207, 105, 139)
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: GradientText(
                        'Feel some music!',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 119, 119, 119),
                          Color.fromARGB(255, 119, 119, 119),
                        ]),
                      ),
                    ),
                    SearchBox(
                        onTextChanged: (value) {},
                        ScreenDimension: ScreenDimension,
                        hint: 'Search..'),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, bottom: 3),
                      child: Text(
                        'Trendings',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 23, 90, 145)),
                      ),
                    ),
                    Consumer<HomeProvider>(builder: (context, state, child) {
                      return SizedBox(
                        height: 150,
                        child: (state.TopTrends.length == 0)
                            ? Shimmer.fromColors(
                                baseColor: Color.fromARGB(255, 233, 233, 233)!,
                                highlightColor:
                                    Color.fromARGB(255, 231, 231, 231)!,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (bc, index) {
                                    return Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      width: 110.0,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    );
                                  },
                                  itemCount: 5,
                                ),
                              )
                            : ListView.builder(
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
                              ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                        'Suggestions',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 23, 90, 145)),
                      ),
                    ),
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
