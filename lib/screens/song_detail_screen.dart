import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/song_provider.dart';

class SongDetailScreen extends StatelessWidget {
  final String songId;

  const SongDetailScreen({required this.songId, super.key});

  @override
  Widget build(BuildContext context) {
    final song = Provider.of<SongProvider>(context).getSongById(songId);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E12),
      appBar: AppBar(
        title: Text(song.title),
        backgroundColor: const Color(0xFF0E0E12),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  song.imageUrl,
                  width: screenWidth * 0.5, // 50% of screen width
                  height: screenWidth * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                song.artist,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                '🎵 Now playing... This is Details',
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
