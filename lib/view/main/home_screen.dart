import 'package:cinema_app/view/main/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:cinema_app/data/movie_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SizedBox(height: 50.0),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: const [
                Text(
                  'Hello ',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                ),
                Text(
                  'Neddy AP',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.orange,
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundImage: AssetImage('path_to_profile_picture'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: const Color(0xFF2A2B37).withOpacity(0.7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26.0),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: const [
                Text(
                  'Feature ',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                ),
                Text(
                  'Movie',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(movie: movieList[index]),
                      ),
                    );
                  },
                  child: MovieCard(
                    movie: movieList[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

