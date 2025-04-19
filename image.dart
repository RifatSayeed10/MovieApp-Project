// import 'package:assignment1/auth.dart';
// import 'package:assignment1/login.dart';
// import 'package:flutter/material.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   Authservice authservice = Authservice();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             'assets/images/home.png',
//             fit: BoxFit.cover,
//           ),
//           Positioned(
//             top: 40,
//             right: 20,
//             child: ElevatedButton(
//               onPressed: () async {
//                 authservice.signout();
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => Login()),
//                 );
//               },
//               child: Text('Sign Out'),
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
















// import 'package:assignment1/Services/services.dart';
// import 'package:assignment1/auth.dart';
// import 'package:assignment1/login.dart';
// import 'package:carousel_slider/carousel_slider.dart' as carousel;
// import 'package:carousel_slider/carousel_controller.dart' as carousel_ctrl;
// import 'package:flutter/material.dart' hide CarouselController;
// import 'package:assignment1/Model/model.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   Authservice authservice = Authservice();
//   late Future<List<Movie>> nowShowing;
//   final carousel_ctrl.CarouselController _carouselController = carousel_ctrl.CarouselController();

//   @override
//   void initState() {
//     nowShowing = APIservices().getNowShowing();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Movie App"),
//         leading: const Icon(Icons.menu),
//         actions: const [
//           Icon(Icons.search_rounded),
//           SizedBox(width: 20),
//           Icon(Icons.notifications),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Now Showing",
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 fontSize: 18,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 10),
//             FutureBuilder<List<Movie>>(
//               future: nowShowing,
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 final movies = snapshot.data!;
//                 return carousel.CarouselSlider.builder(
//                   carouselController: _carouselController,
//                   itemCount: movies.length,
//                   itemBuilder: (context, index, movieIndex) {
//                     final movie = movies[index];
//                     return Stack(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(
//                                 "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     );
//                   },
//                   options: carousel.CarouselOptions(
//                     autoPlay: true,
//                     enlargeCenterPage: true,
//                     aspectRatio: 1.7,
//                     autoPlayInterval: const Duration(seconds: 3),
//                   ),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }