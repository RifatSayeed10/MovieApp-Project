// ✅ profile_page.dart (New File)
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment1/Services/services.dart';
import 'package:assignment1/Model/model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  final api = APIservices();
  List<Movie> favoriteMovies = [];
  List<Movie> downloadedMovies = [];

  Future<void> loadMovies() async {
    final prefs = await SharedPreferences.getInstance();
    final favIds = prefs.getStringList('favorites') ?? [];
    final downIds = prefs.getStringList('downloads') ?? [];

    final favMovies = await Future.wait(
        favIds.map((id) => api.getMovieDetail(int.parse(id))));
    final downMovies = await Future.wait(
        downIds.map((id) => api.getMovieDetail(int.parse(id))));

    setState(() {
      favoriteMovies = favMovies;
      downloadedMovies = downMovies;
    });
  }

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Email: ${user?.email ?? 'No email'}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("Name: ${user?.displayName ?? 'No name'}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            const Text("Favorite Movies",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...favoriteMovies.map((movie) => ListTile(
                  leading: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w200/${movie.posterPath}',
                    width: 50,
                  ),
                  title: Text(movie.title),
                )),
            const SizedBox(height: 24),
            const Text("Downloaded Movies",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...downloadedMovies.map((movie) => ListTile(
                  leading: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w200/${movie.posterPath}',
                    width: 50,
                  ),
                  title: Text(movie.title),
                )),
          ],
        ),
      ),
    );
  }
}