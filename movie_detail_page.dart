// import 'package:flutter/material.dart';
// import 'package:assignment1/Services/services.dart';
// import 'package:assignment1/Model/model.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class MovieDetailPage extends StatelessWidget {
//   final int movieId;
//   final bool isDarkMode;

//   const MovieDetailPage({super.key, required this.movieId, required this.isDarkMode});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       appBar: AppBar(
//         title: const Text('Movie Details'),
//         backgroundColor: isDarkMode ? Colors.black : Colors.blue,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: FutureBuilder<Movie>(
//         future: APIservices().getMovieDetail(movieId),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator(color: isDarkMode ? Colors.white : Colors.blue));
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)));
//           }

//           final movie = snapshot.data!;
//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (movie.backDropPath.isNotEmpty)
//                   CachedNetworkImage(
//                     imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.backDropPath}',
//                     width: double.infinity,
//                     height: 200,
//                     fit: BoxFit.cover,
//                   ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         movie.title,
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: isDarkMode ? Colors.white : Colors.black,
//                         ),
//                       ),
//                     ),
//                     Icon(Icons.download, color: isDarkMode ? Colors.white : Colors.black),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "Rating: ${movie.rating}",
//                   style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white70 : Colors.black87),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   movie.overview,
//                   style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black87),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:assignment1/Services/services.dart';
// import 'package:assignment1/Model/model.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class MovieDetailPage extends StatelessWidget {
//   final int movieId;
//   final bool isDarkMode;

//   const MovieDetailPage(
//       {super.key, required this.movieId, required this.isDarkMode});

//   @override
//   Widget build(BuildContext context) {
//     final apiService = APIservices();

//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         iconTheme:
//             IconThemeData(color: isDarkMode ? Colors.white : Colors.black),
//         elevation: 0,
//         actions: [
//           Icon(Icons.favorite_border,
//               color: isDarkMode ? Colors.white : Colors.black),
//           const SizedBox(width: 16),
//         ],
//       ),
//       extendBodyBehindAppBar: true,
//       body: FutureBuilder<Movie>(
//         future: apiService.getMovieDetail(movieId),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//                 child: CircularProgressIndicator(
//                     color: isDarkMode ? Colors.white : Colors.blue));
//           }

//           final movie = snapshot.data!;

//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl:
//                           'https://image.tmdb.org/t/p/w500/${movie.backDropPath}',
//                       height: 300,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                     Positioned(
//                       bottom: 20,
//                       left: 16,
//                       child: Row(
//                         children: [
//                           if (movie.posterPath != null)
//                             CachedNetworkImage(
//                               imageUrl:
//                                   'https://image.tmdb.org/t/p/w200/${movie.posterPath}',
//                               width: 100,
//                               height: 150,
//                               fit: BoxFit.cover,
//                             ),
//                           const SizedBox(width: 16),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(movie.title,
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold)),
//                               const SizedBox(height: 4),
//                               Text(movie.genres.join(" | "),
//                                   style: const TextStyle(
//                                       color: Colors.white70, fontSize: 12)),
//                               const SizedBox(height: 4),
//                               Row(
//                                 children: [
//                                   const Icon(Icons.star,
//                                       color: Colors.amber, size: 18),
//                                   const SizedBox(width: 4),
//                                   Text("${movie.rating}",
//                                       style:
//                                           const TextStyle(color: Colors.white)),
//                                 ],
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(movie.overview,
//                       style: TextStyle(
//                           color: isDarkMode ? Colors.white70 : Colors.black87,
//                           fontSize: 16)),
//                 ),
//                 // Cast Section
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Cast",
//                           style: TextStyle(
//                               color: isDarkMode ? Colors.white : Colors.black,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 FutureBuilder<List<CastMember>>(
//                   future: apiService.getCast(movieId),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData)
//                       return const Center(child: CircularProgressIndicator());
//                     final castList = snapshot.data!;
//                     return SizedBox(
//                       height: 100,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: castList.length,
//                         itemBuilder: (context, index) {
//                           final cast = castList[index];
//                           return Container(
//                             width: 80,
//                             margin: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Column(
//                               children: [
//                                 CircleAvatar(
//                                   radius: 30,
//                                   backgroundImage: cast.profilePath != null
//                                       ? NetworkImage(
//                                           'https://image.tmdb.org/t/p/w200/${cast.profilePath}')
//                                       : null,
//                                   backgroundColor: Colors.grey,
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(cast.name,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         color: isDarkMode
//                                             ? Colors.white
//                                             : Colors.black)),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 const Divider(),
//                 // Reviews Section
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text("Reviews",
//                       style: TextStyle(
//                           color: isDarkMode ? Colors.white : Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold)),
//                 ),
//                 const SizedBox(height: 8),
//                 FutureBuilder<List<Review>>(
//                   future: apiService.getReviews(movieId),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData)
//                       return const Center(child: CircularProgressIndicator());
//                     final reviews = snapshot.data!;
//                     return Column(
//                       children: reviews.take(3).map((review) {
//                         return ListTile(
//                           leading:
//                               const CircleAvatar(child: Icon(Icons.person)),
//                           title: Text(review.author),
//                           subtitle: Text(review.content,
//                               maxLines: 3, overflow: TextOverflow.ellipsis),
//                           trailing: review.rating != null
//                               ? Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     const Icon(Icons.star,
//                                         color: Colors.amber, size: 16),
//                                     Text("${review.rating}"),
//                                   ],
//                                 )
//                               : null,
//                         );
//                       }).toList(),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 Center(
//                   child: ElevatedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.download),
//                     label: const Text("Download"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 24, vertical: 12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



// 📁 movie_detail_page.dart
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:assignment1/Services/services.dart';
// import 'package:assignment1/Model/model.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MovieDetailPage extends StatefulWidget {
//   final int movieId;
//   final bool isDarkMode;

//   const MovieDetailPage(
//       {super.key, required this.movieId, required this.isDarkMode});

//   @override
//   State<MovieDetailPage> createState() => _MovieDetailPageState();
// }

// class _MovieDetailPageState extends State<MovieDetailPage> {
//   late Future<Movie> movieFuture;
//   bool isFavorite = false;
//   bool isDownloaded = false;

//   @override
//   void initState() {
//     super.initState();
//     movieFuture = APIservices().getMovieDetail(widget.movieId);
//     _checkFavorites();
//     _checkDownloads();
//   }

//   Future<void> _checkFavorites() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> favorites = prefs.getStringList('favoriteMovies') ?? [];
//     final match =
//         favorites.any((item) => jsonDecode(item)['id'] == widget.movieId);
//     setState(() {
//       isFavorite = match;
//     });
//   }

//   Future<void> _checkDownloads() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> downloads = prefs.getStringList('downloadedMovies') ?? [];
//     final match =
//         downloads.any((item) => jsonDecode(item)['id'] == widget.movieId);
//     setState(() {
//       isDownloaded = match;
//     });
//   }

//   Future<void> _toggleFavorite(Movie movie) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> favorites = prefs.getStringList('favoriteMovies') ?? [];

//     final movieJson = jsonEncode({
//       'id': movie.id,
//       'title': movie.title,
//       'backDropPath': movie.backDropPath,
//       'rating': movie.rating,
//     });

//     if (isFavorite) {
//       favorites.removeWhere((item) => jsonDecode(item)['id'] == movie.id);
//     } else {
//       favorites.add(movieJson);
//     }

//     await prefs.setStringList('favoriteMovies', favorites);
//     setState(() {
//       isFavorite = !isFavorite;
//     });
//   }

//   Future<void> _downloadMovie(Movie movie) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> downloads = prefs.getStringList('downloadedMovies') ?? [];

//     final movieJson = jsonEncode({
//       'id': movie.id,
//       'title': movie.title,
//       'backDropPath': movie.backDropPath,
//       'rating': movie.rating,
//     });

//     if (!isDownloaded) {
//       downloads.add(movieJson);
//       await prefs.setStringList('downloadedMovies', downloads);
//       setState(() {
//         isDownloaded = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final apiService = APIservices();

//     return Scaffold(
//       backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         iconTheme: IconThemeData(
//             color: widget.isDarkMode ? Colors.white : Colors.black),
//         elevation: 0,
//         actions: [
//           FutureBuilder<Movie>(
//             future: movieFuture,
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) return const SizedBox();
//               return IconButton(
//                 icon: Icon(
//                   isFavorite ? Icons.favorite : Icons.favorite_border,
//                   color: widget.isDarkMode ? Colors.redAccent : Colors.red,
//                 ),
//                 onPressed: () => _toggleFavorite(snapshot.data!),
//               );
//             },
//           ),
//           const SizedBox(width: 16),
//         ],
//       ),
//       extendBodyBehindAppBar: true,
//       body: FutureBuilder<Movie>(
//         future: movieFuture,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: widget.isDarkMode ? Colors.white : Colors.blue,
//               ),
//             );
//           }

//           final movie = snapshot.data!;

//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl:
//                           'https://image.tmdb.org/t/p/w500/${movie.backDropPath}',
//                       height: 300,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                     Positioned(
//                       bottom: 20,
//                       left: 16,
//                       child: Row(
//                         children: [
//                           if (movie.posterPath != null)
//                             CachedNetworkImage(
//                               imageUrl:
//                                   'https://image.tmdb.org/t/p/w200/${movie.posterPath}',
//                               width: 100,
//                               height: 150,
//                               fit: BoxFit.cover,
//                             ),
//                           const SizedBox(width: 16),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 movie.title,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 movie.genres.join(" | "),
//                                 style: const TextStyle(
//                                     color: Colors.white70, fontSize: 12),
//                               ),
//                               const SizedBox(height: 4),
//                               Row(
//                                 children: [
//                                   const Icon(Icons.star,
//                                       color: Colors.amber, size: 18),
//                                   const SizedBox(width: 4),
//                                   Text(
//                                     "${movie.rating}",
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     movie.overview,
//                     style: TextStyle(
//                       color:
//                           widget.isDarkMode ? Colors.white70 : Colors.black87,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Cast",
//                         style: TextStyle(
//                           color:
//                               widget.isDarkMode ? Colors.white : Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 FutureBuilder<List<CastMember>>(
//                   future: apiService.getCast(widget.movieId),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData)
//                       return const Center(child: CircularProgressIndicator());
//                     final castList = snapshot.data!;
//                     return SizedBox(
//                       height: 100,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: castList.length,
//                         itemBuilder: (context, index) {
//                           final cast = castList[index];
//                           return Container(
//                             width: 80,
//                             margin: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Column(
//                               children: [
//                                 CircleAvatar(
//                                   radius: 30,
//                                   backgroundImage: cast.profilePath != null
//                                       ? NetworkImage(
//                                           'https://image.tmdb.org/t/p/w200/${cast.profilePath}')
//                                       : null,
//                                   backgroundColor: Colors.grey,
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   cast.name,
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: widget.isDarkMode
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 const Divider(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text(
//                     "Reviews",
//                     style: TextStyle(
//                       color: widget.isDarkMode ? Colors.white : Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 FutureBuilder<List<Review>>(
//                   future: apiService.getReviews(widget.movieId),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData)
//                       return const Center(child: CircularProgressIndicator());
//                     final reviews = snapshot.data!;
//                     return Column(
//                       children: reviews.take(3).map((review) {
//                         return ListTile(
//                           leading:
//                               const CircleAvatar(child: Icon(Icons.person)),
//                           title: Text(review.author),
//                           subtitle: Text(review.content,
//                               maxLines: 3, overflow: TextOverflow.ellipsis),
//                           trailing: review.rating != null
//                               ? Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     const Icon(Icons.star,
//                                         color: Colors.amber, size: 16),
//                                     Text("${review.rating}"),
//                                   ],
//                                 )
//                               : null,
//                         );
//                       }).toList(),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 Center(
//                   child: ElevatedButton.icon(
//                     onPressed:
//                         isDownloaded ? null : () => _downloadMovie(movie),
//                     icon: const Icon(Icons.download),
//                     label: Text(isDownloaded ? "Downloaded" : "Download"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 24, vertical: 12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:assignment1/Services/services.dart';
import 'package:assignment1/Model/model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;
  final bool isDarkMode;

  const MovieDetailPage(
      {super.key, required this.movieId, required this.isDarkMode});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late Future<Movie> movieFuture;
  bool isFavorite = false;
  bool isDownloaded = false;
  String? videoKey;
  late YoutubePlayerController _youtubeController;
  bool isTrailerReady = false;

  @override
  void initState() {
    super.initState();
    movieFuture = APIservices().getMovieDetail(widget.movieId);
    _checkFavorites();
    _checkDownloads();
    _loadTrailer();
  }

  Future<void> _checkFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favoriteMovies') ?? [];
    final match =
        favorites.any((item) => jsonDecode(item)['id'] == widget.movieId);
    setState(() {
      isFavorite = match;
    });
  }

  Future<void> _checkDownloads() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> downloads = prefs.getStringList('downloadedMovies') ?? [];
    final match =
        downloads.any((item) => jsonDecode(item)['id'] == widget.movieId);
    setState(() {
      isDownloaded = match;
    });
  }

  Future<void> _toggleFavorite(Movie movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favoriteMovies') ?? [];

    final movieJson = jsonEncode({
      'id': movie.id,
      'title': movie.title,
      'backDropPath': movie.backDropPath,
      'rating': movie.rating,
    });

    if (isFavorite) {
      favorites.removeWhere((item) => jsonDecode(item)['id'] == movie.id);
    } else {
      favorites.add(movieJson);
    }

    await prefs.setStringList('favoriteMovies', favorites);
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  Future<void> _downloadMovie(Movie movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> downloads = prefs.getStringList('downloadedMovies') ?? [];

    final movieJson = jsonEncode({
      'id': movie.id,
      'title': movie.title,
      'backDropPath': movie.backDropPath,
      'rating': movie.rating,
    });

    if (!isDownloaded) {
      downloads.add(movieJson);
      await prefs.setStringList('downloadedMovies', downloads);
      setState(() {
        isDownloaded = true;
      });
    }
  }

  Future<void> _loadTrailer() async {
    String? key = await APIservices().getMovieTrailer(widget.movieId);
    print("Trailer key: $key"); // Debugging line
    if (key != null) {
      _youtubeController = YoutubePlayerController(
        initialVideoId: key,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
      setState(() {
        videoKey = key;
        isTrailerReady = true;
      });
    } else {
      setState(() {
        isTrailerReady =
            false; // Ensure trailer is marked as unavailable if no trailer
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final apiService = APIservices();

    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
            color: widget.isDarkMode ? Colors.white : Colors.black),
        elevation: 0,
        actions: [
          FutureBuilder<Movie>(
            future: movieFuture,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox();
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: widget.isDarkMode ? Colors.redAccent : Colors.red,
                ),
                onPressed: () => _toggleFavorite(snapshot.data!),
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder<Movie>(
        future: movieFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: widget.isDarkMode ? Colors.white : Colors.blue,
              ),
            );
          }

          final movie = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500/${movie.backDropPath}',
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20,
                      left: 16,
                      child: Row(
                        children: [
                          if (movie.posterPath != null)
                            CachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w200/${movie.posterPath}',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                movie.genres.join(" | "),
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 18),
                                  const SizedBox(width: 4),
                                  Text(
                                    "${movie.rating}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                if (isTrailerReady)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: YoutubePlayer(
                      controller: _youtubeController,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor:
                          widget.isDarkMode ? Colors.white : Colors.blue,
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "No trailer available",
                      style: TextStyle(
                        color:
                            widget.isDarkMode ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    movie.overview,
                    style: TextStyle(
                      color:
                          widget.isDarkMode ? Colors.white70 : Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cast",
                        style: TextStyle(
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                FutureBuilder<List<CastMember>>(
                  future: apiService.getCast(widget.movieId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return const Center(child: CircularProgressIndicator());
                    final castList = snapshot.data!;
                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: castList.length,
                        itemBuilder: (context, index) {
                          final cast = castList[index];
                          return Container(
                            width: 80,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: cast.profilePath != null
                                      ? NetworkImage(
                                          'https://image.tmdb.org/t/p/w200/${cast.profilePath}')
                                      : null,
                                  backgroundColor: Colors.grey,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  cast.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: widget.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                FutureBuilder<List<Review>>(
                  future: apiService.getReviews(widget.movieId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return const Center(child: CircularProgressIndicator());
                    final reviews = snapshot.data!;
                    return Column(
                      children: reviews.take(3).map((review) {
                        return ListTile(
                          leading:
                              const CircleAvatar(child: Icon(Icons.person)),
                          title: Text(review.author),
                          subtitle: Text(review.content,
                              maxLines: 3, overflow: TextOverflow.ellipsis),
                          trailing: review.rating != null
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    Text("${review.rating}"),
                                  ],
                                )
                              : null,
                        );
                      }).toList(),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton.icon(
                    onPressed:
                        isDownloaded ? null : () => _downloadMovie(movie),
                    icon: const Icon(Icons.download),
                    label: Text(isDownloaded ? "Downloaded" : "Download"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}
