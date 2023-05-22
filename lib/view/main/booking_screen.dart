import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  final String movieTitle;
  final String image;
  final double ticketPrice;
  final List<List<bool>> seatAvailability; // List of seat availability, true if available, false if not
  final List<String> dates;
  final List<String> times;

  const BookingPage({Key? key, required this.movieTitle, required this.seatAvailability,required this.ticketPrice, required this.image, required this.dates, required this.times}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}
class _BookingPageState extends State<BookingPage> {
  List<List<int>> seatStatus = [];
  Set<List<int>> selectedSeats = {};

  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;

  @override
  void initState() {
    super.initState();
    initializeSeatStatus();
  }

  void initializeSeatStatus() {
    seatStatus = List.generate(
      widget.seatAvailability.length,
          (row) => List.generate(widget.seatAvailability[0].length, (col) => 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C28),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movieTitle,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Seat Availability',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 8,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                        ),
                        itemCount: widget.seatAvailability.length * widget.seatAvailability[0].length,
                        itemBuilder: (context, index) {
                          final row = index ~/ widget.seatAvailability[0].length;
                          final col = index % widget.seatAvailability[0].length;
                          final isAvailable = widget.seatAvailability[row][col];
                          final seat = seatStatus[row][col];
                          Color seatColor = Colors.white;
                          String seatText = '';

                          if (row == 0 && (col < 2 || col >= widget.seatAvailability[0].length - 2)) {
                            seatColor = Colors.transparent;
                          } else if (row == 1 && (col < 1 || col >= widget.seatAvailability[0].length - 1)) {
                            seatColor = Colors.transparent;
                          } else {
                            if (seat == 0) {
                              seatColor = isAvailable ? Colors.white : Colors.grey[700]!;
                              seatText = '${String.fromCharCode(65 + row)}${col + 1}';
                            } else if (seat == 1) {
                              seatColor = Colors.grey[700]!;
                              seatText = '${String.fromCharCode(65 + row)}${col + 1}';
                            } else if (seat == 2) {
                              seatColor = Colors.orange;
                              seatText = '${String.fromCharCode(65 + row)}${col + 1}';
                            }
                          }

                          final isSelected = selectedSeats.contains([row, col]);

                          return ElevatedButton(
                            onPressed: isAvailable ? () => selectSeat(row, col) : null,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(isSelected ? Colors.orange : seatColor),
                            ),
                            child: Text(
                              seatText,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    const Text('Date:'),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                widget.dates.length,
                                    (index) => GestureDetector(
                                  onTap: () => selectDate(index),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                    decoration: BoxDecoration(
                                      color: index == selectedDateIndex ? Colors.orange : Colors.grey[900],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Text(
                                      widget.dates[index],
                                      style: TextStyle(
                                        fontWeight: index == selectedDateIndex ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Time:'),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                widget.times.length,
                                    (index) => GestureDetector(
                                  onTap: () => selectTime(index),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                    decoration: BoxDecoration(
                                      color: index == selectedTimeIndex ? Colors.orange : Colors.grey[900],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Text(
                                      widget.times[index],
                                      style: TextStyle(
                                        fontWeight: index == selectedTimeIndex ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            'Total Price: \$${widget.ticketPrice * selectedSeats.length}',
                            style: const TextStyle(
                              fontSize: 18.0
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => reserveNow(),
                            child: const Text('Reserve Now'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectSeat(int row, int col) {
    setState(() {
      final seat = seatStatus[row][col];
      if (seat == 0) {
        seatStatus[row][col] = 2;
        selectedSeats.add([row, col]);
      } else if (seat == 2) {
        seatStatus[row][col] = 0;
        selectedSeats.remove([row, col]);
      }
    });
  }

  void selectDate(int index) {
    setState(() {
      selectedDateIndex = index;
    });
  }

  void selectTime(int index) {
    setState(() {
      selectedTimeIndex = index;
    });
  }

  void reserveNow() {
    if (selectedSeats.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please select at least one seat.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      String selectedDate = widget.dates[selectedDateIndex];
      String selectedTime = widget.times[selectedTimeIndex];

      List<String> selectedSeatNames = selectedSeats
          .map((seat) => '${String.fromCharCode(65 + seat[1])}${seat[0] + 1}')
          .toList();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Reservation Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Movie: ${widget.movieTitle}'),
              const SizedBox(height: 8.0),
              Text('Date: $selectedDate'),
              const SizedBox(height: 8.0),
              Text('Time: $selectedTime'),
              const SizedBox(height: 8.0),
              Text('Seats: ${selectedSeatNames.join(', ')}'),
              const SizedBox(height: 8.0),
              Text('Total Price: \$${widget.ticketPrice * selectedSeats.length}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Perform the reservation logic here
                // ...

                Navigator.pop(context);
              },
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
    }
  }

}
