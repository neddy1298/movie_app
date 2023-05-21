import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, Key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Menyimpan indeks ikon yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF1C1C28),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0,),
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
                      'Username',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
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
                    fillColor: const Color(0xFF2A2B37),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
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
                  ],
                ),
              ),
              const SizedBox(height: 20.0,),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movie: movieList[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomNavigationBarItem(0, Icons.home, 'Home'),
                  _buildBottomNavigationBarItem(1, Icons.explore, 'Explore'),
                  _buildBottomNavigationBarItem(2, Icons.movie, 'Movie'),
                  _buildBottomNavigationBarItem(3, Icons.person, 'Profile'),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBarItem(int index, IconData iconData, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Icon(
            iconData,
            color: _selectedIndex == index ? Colors.white : Colors.grey,
          ),
          const SizedBox(height: 2.0),
          _selectedIndex == index
              ? Container(
            width: 6.0,
            height: 6.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class Movie {
  final String title;
  final String imagePath;

  Movie({required this.title, required this.imagePath});
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Image.asset(movie.imagePath), // Hanya menampilkan gambar
      ),
    );
  }
}


List<Movie> movieList = [
  Movie(
    title: 'Movie 1',
    imagePath: 'assets/images/movies/movie1.jpg',
  ),
  Movie(
    title: 'Movie 2',
    imagePath: 'assets/images/movies/movie2.jpg',
  ),
  Movie(
    title: 'Movie 3',
    imagePath: 'assets/images/movies/movie3.jpg',
  ),
  Movie(
    title: 'Movie 4',
    imagePath: 'assets/images/movies/movie4.jpg',
  ),
  Movie(
    title: 'Movie 5',
    imagePath: 'assets/images/movies/movie5.jpg',
  ),
  // Add more movies as needed
];

