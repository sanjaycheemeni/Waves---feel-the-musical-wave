import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:waves/provider/home_provider.dart';
import 'package:waves/provider/search_provider.dart';
import 'package:waves/screens/homepage.dart';
import 'package:waves/screens/music_player_page.dart';
import 'package:waves/screens/searchpage.dart';
import 'package:waves/services/musicService.dart';

import 'provider/player_provider.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var l = MusicService().getTrendingList();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlayerProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'ProductSans'),
        home: HomePage(),
      ),
    );
  }
}
