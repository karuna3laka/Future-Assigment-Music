import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/song_provider.dart';
import '../widgets/song_card.dart';
import 'song_detail_screen.dart';

class SongListScreen extends StatelessWidget {
  const SongListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E12),
      appBar: AppBar(
        title: const Text('Future-Music', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0E0E12),
        elevation: 0,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert, color: Colors.white),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<SongProvider>(context, listen: false).loadSongs(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final songs = Provider.of<SongProvider>(context).songs;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ['All']
                      .map(
                        (filter) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: filter == 'All'
                            ? Colors.greenAccent
                            : Colors.white12,
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          color: filter == 'All'
                              ? Colors.black
                              : Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: songs.length,
                  itemBuilder: (ctx, i) => SongCard(
                    song: songs[i],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              SongDetailScreen(songId: songs[i].id),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
