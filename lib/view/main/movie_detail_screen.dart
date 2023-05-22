import 'package:cinema_app/data/movie_data.dart';
import 'package:cinema_app/view/main/booking_screen.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            movie.imagePath,
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                stops: const [0.05, 0.2],
                colors: [
                  Colors.transparent,
                  const Color(0x99000000).withOpacity(0.9),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x99000000),
                ),
                margin: const EdgeInsets.all(16.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 28.0),
                  Text(
                    movie.synopsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 26.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookingPage(movieTitle: movie.title, ticketPrice: movie.ticketPrice, image: movie.imagePath, dates: movie.dates, times: movie.times,seatAvailability: movie.seatAvailability,)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Get Reservation'),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
