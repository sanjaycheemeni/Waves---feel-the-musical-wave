import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:waves/provider/player_provider.dart';
import 'package:waves/screens/music_player_page.dart';

class MusicProgressBar extends StatelessWidget {
  const MusicProgressBar({
    super.key,
    required this.ScreenDimension,
  });

  final Size ScreenDimension;

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(builder: (context, state, child) {
      return Positioned(
          bottom: 10,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MusicPlayer()),
            ),
            child: SizedBox(
              width: ScreenDimension.width,
              height: ScreenDimension.height * .15,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: ScreenDimension.width * .85,
                      height: ScreenDimension.height * .08,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 79, 79, 79)
                                  .withOpacity(0.35),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Color.fromARGB(255, 226, 241, 230),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    //
                    //

                    //
                    //
                    //

                    // progress container
                    Container(
                      width: seekBarValue(ScreenDimension.width * .85,
                                  (state.currentValue * 1000)) >
                              8
                          ? seekBarValue(ScreenDimension.width * .85,
                              (state.currentValue * 1000))
                          : 8,
                      // width: 100,
                      height: ScreenDimension.height * .08,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 190, 191, 220),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(
                                  state.currentValue < 0.99 ? 0 : 10),
                              bottomRight: Radius.circular(
                                  state.currentValue < 0.99 ? 0 : 10))),
                    ),
                    //
                    //
                    //
                    //

                    SizedBox(
                      // color: const Color.fromARGB(36, 244, 67, 54),
                      width: ScreenDimension.width * .85,
                      height: ScreenDimension.height * .08,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(10),
                            SizedBox(
                              width: ScreenDimension.height * .05,
                              height: ScreenDimension.height * .05,
                              // color: Colors.lightBlueAccent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  state.imageURL,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Gap(10),
                            SizedBox(
                              width: ScreenDimension.width * .45,
                              // color: Colors.green,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.title,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Color(0xFF313292),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(state.description,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 124, 124, 162),
                                        fontSize: 12,
                                      ))
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => state.playNextSong(),
                              child: Icon(
                                Icons.skip_previous,
                                color: Color(0xFF6A7DE9),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                state.playPause();
                              },
                              child: Icon(
                                state.isPlaying
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                                color: Color(0xFF6A7DE9),
                                size: 50,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => state.playNextSong(),
                              child: Icon(
                                Icons.skip_next,
                                color: Color(0xFF6A7DE9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}

double seekBarValue(double baseValue, double percentage) =>
    (baseValue * 0.1) * (percentage / 100.0000);
