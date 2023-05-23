import 'package:flutter/material.dart';
import 'package:cinema_app/data/movie_data.dart';
import 'package:cinema_app/view/main/movie_detail_screen.dart';

class MyTicketPage extends StatelessWidget {
  const MyTicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'My Tickets',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: 3, // Ubah sesuai dengan jumlah kategori tiket yang ingin ditampilkan
              itemBuilder: (context, index) {
                String categoryTitle;
                List<Movie> movies;
                if (index == 0) {
                  categoryTitle = 'Today';
                  movies = movieList; // Ubah dengan daftar tiket hari ini
                } else if (index == 1) {
                  categoryTitle = 'Upcoming';
                  movies = movieList; // Ubah dengan daftar tiket yang akan datang
                } else {
                  categoryTitle = 'Expired';
                  movies = movieList; // Ubah dengan daftar tiket yang sudah kedaluwarsa
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                      child: Text(
                        '$categoryTitle Tickets',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailPage(movie: movie),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                width: 330,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.1),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(movie.imagePath),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              movie.title,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Divider(
                                              color: Colors.white.withOpacity(0.5),
                                              height: 1,
                                              thickness: 1,
                                              endIndent: 10,
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 22,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  '${movie.rating}',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 25),
                                            Text(
                                              movie.director,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
