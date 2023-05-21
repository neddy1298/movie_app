
import 'package:flutter/material.dart';

class Movie {
  final String imagePath;
  final String title;
  final String synopsis;
  final double ticketPrice;

  Movie({
    required this.imagePath,
    required this.title,
    required this.synopsis,
    required this.ticketPrice,
  });
}

final List<String> categories = [
  'Action',
  'Adventure',
  'Comedy',
  'Drama',
  'Horror',
  'Romance',
];

final List<Movie> movieList = [
  Movie(
    imagePath: 'assets/images/movies/movie1.jpg',
    title: 'The Mandalorian Season 3',
    synopsis: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ticketPrice: 10.0,
  ),
  Movie(
    imagePath: 'assets/images/movies/movie2.jpg',
    title: 'Vikings: Valhalla Season 2',
    synopsis: 'Musim kedua dari serial Vikings: Valhalla',
    ticketPrice: 12.0,
  ),
  Movie(
    imagePath: 'assets/images/movies/movie3.jpg',
    title: 'Treason',
    synopsis: 'Kisah ini menceritakan tentang seorang agen mata-mata bernama Adam Lawrence. Ia merupakan agen M16 yang sudah ditempak dengan baik dan maksimal. Adam digadang-gadang sebagai agen yang dapat diandalakan. Selain itu, Adam juga menjalani kehidupan normal seperti manusia pada umumnya.',
    ticketPrice: 8.0,
  ),
  Movie(
    imagePath: 'assets/images/movies/movie4.jpg',
    title: 'Unwelcome',
    synopsis: 'Londoners Maya and Jamie escape their urban nightmare to the tranquility of rural Ireland only to discover malevolent, murderous goblins lurking in the gnarled, ancient wood at the foot of their new garden. When heavily pregnant Maya’s relationship with a local family turns sour, who – or what – will come to her rescue and what extremes will she go to to protect her unborn child?',
    ticketPrice: 15.0,
  ),
  Movie(
    imagePath: 'assets/images/movies/movie5.jpg',
    title: 'The Super Mario Bros. Movie',
    synopsis: 'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
    ticketPrice: 15.0,
  ),
  // Add more movies as needed
];

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

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