import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import '../models/song.dart';

class SongProvider with ChangeNotifier {
  List<Song> _songs = [];

  List<Song> get songs => _songs;

  Future<void> loadSongs() async {
    final String response = await rootBundle.loadString('assets/songs.json');
    final List<dynamic> data = json.decode(response);
    _songs = data.map((item) => Song.fromJson(item)).toList();
    notifyListeners();
  }

  Song getSongById(String id) {
    return _songs.firstWhere((song) => song.id == id);
  }
}
