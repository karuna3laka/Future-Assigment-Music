import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/song_provider.dart';
import './screens/song_list_screen.dart';

void main() {
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SongProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Player',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF0E0E12),
        ),
        home: const SongListScreen(),
      ),
    );
  }
}
