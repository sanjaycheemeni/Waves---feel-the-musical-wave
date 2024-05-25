import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:waves/provider/player_provider.dart';
import 'package:waves/util/time.dart';
import '../screens/music_player_page.dart';
import '../util/colors.dart';

class GlobalSearchItem extends StatefulWidget {
  GlobalSearchItem(
      {super.key, required this.ScreenDimension, required this.data});

  final ScreenDimension;
  final data;

  @override
  State<GlobalSearchItem> createState() => _GlobalSearchItemState();
}

class _GlobalSearchItemState extends State<GlobalSearchItem> {
  Color _dominantColor = Colors.white;

  @override
  void initState() {
    super.initState();
    // _updatePalette();
  }

  // Future<void> _updatePalette() async {
  //   final PaletteGenerator paletteGenerator =
  //       await PaletteGenerator.fromImageProvider(
  //     CachedNetworkImageProvider(widget.data.image[0].url),
  //   );
  //   setState(() {
  //     _dominantColor = paletteGenerator.dominantColor?.color ?? Colors.white;

  //     print('color ${_dominantColor}');
  //   });
  // }

  // Color lightenColor(Color? color, [double amount = 0.9]) {
  //   color = color ?? Colors.white;
  //   assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');
  //   final p = amount;
  //   final r = color.red + ((255 - color.red) * p).round();
  //   final g = color.green + ((255 - color.green) * p).round();
  //   final b = color.blue + ((255 - color.blue) * p).round();
  //   return Color.fromARGB(color.alpha, r, g, b);
  // }

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<PlayerProvider>(context);

    return GestureDetector(
      onTap: () {
        final audioPlayer = Provider.of<PlayerProvider>(context, listen: false);
        audioPlayer.setMetadata(
          song: widget.data,
          id: widget.data.id,
          title: widget.data.name,
          description: widget.data.label,
          audioURL: widget.data.downloadUrl[3].url,
          imageURL: widget.data.image[2].url,
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MusicPlayer()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Container(
          width: widget.ScreenDimension.width * .85,
          height: widget.ScreenDimension.height * .1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.35),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              children: [
                SizedBox(
                  width: widget.ScreenDimension.width * .2,
                  height: widget.ScreenDimension.height * .1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.network(
                      widget.data.image[1].url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: widget.ScreenDimension.width * .65,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.data.name,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            // color: _dominantColor
                            color: Color.fromARGB(255, 118, 120, 255),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  bottom: 3, top: 3, right: 8),
                              decoration: BoxDecoration(
                                color: (audioProvider.audioURL ==
                                        widget.data.downloadUrl[3].url)
                                    ? Color.fromARGB(255, 210, 255, 211)
                                    : Color.fromARGB(59, 118, 120, 255),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    (audioProvider.audioURL ==
                                            widget.data.downloadUrl[3].url)
                                        ? Icons.pause_rounded
                                        : Icons.play_arrow_rounded,
                                    size: 20,
                                    color: (audioProvider.audioURL ==
                                            widget.data.downloadUrl[3].url)
                                        ? Colors.green
                                        : Color.fromARGB(255, 118, 120, 255),
                                  ),
                                  Text(
                                    (audioProvider.audioURL ==
                                            widget.data.downloadUrl[3].url)
                                        ? 'Playing...'
                                        : formatDuration(widget.data.duration),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: (audioProvider.audioURL ==
                                              widget.data.downloadUrl[3].url)
                                          ? Colors.green
                                          : Color.fromARGB(255, 118, 120, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        Text(
                          widget.data.album.name,
                          maxLines: 1,
                          style: TextStyle(
                              color: Color.fromARGB(255, 110, 110, 110)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
