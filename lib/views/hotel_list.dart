import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/hotel.dart';
import 'package:flutter_application_1/views/Widgets/hotel_card.dart';
import 'package:flutter_application_1/views/hotel_detail.dart';

class HotelList extends StatelessWidget {
  final int stadId;
  final List<Hotel> hotels;

  const HotelList({Key? key, required this.stadId, required this.hotels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.hotel),
              SizedBox(width: 10),
              Text('Nearest Hotels'),
            ],
          ),
          shadowColor: Colors.black,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelDetails(hotel: hotels[index]),
                            ),
                        );
            },
            child: HotelCard(
              title: hotels[index].name,
              review: hotels[index].review.toString(),
              thumbnailUrl: hotels[index].image,
            ),
          );
        },
      ),

    );
  }
}
