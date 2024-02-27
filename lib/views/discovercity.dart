import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/city.dart';
import 'package:flutter_application_1/models/hotel.api.dart';
import 'package:flutter_application_1/models/hotel.dart';
import 'package:flutter_application_1/views/hotel_list.dart';
import 'package:flutter_application_1/views/theme.dart';
import 'package:flutter_application_1/views/transport.dart';

class DiscoverCity extends StatelessWidget {
  final int stadId;
  final City city;

  DiscoverCity({required this.stadId, required this.city});
  
  @override
  Widget build(BuildContext context) {

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 50.0),
        const Icon(
          Icons.location_city_rounded,
          color: Colors.white,
          shadows: [Shadow(color: Colors.black, blurRadius: 10)],
          size: 40.0,
        ),
        SizedBox(
          width: 90.0,
          child: new Divider(color: Colors.yellow),
        ),
        const SizedBox(height: 10.0),
        Text(
          city.name,
          style: TextStyle(color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.black, blurRadius: 10)],),
        ),
         ],
    );


    return Scaffold(
      appBar: AppBar(
        title: const Padding(
            padding:  EdgeInsets.only(left: 60.0),           
            child: Row( children: [
              Image(
                    height: 70,
                    width: 70,
                    image: AssetImage('lib/assets/logo2.png')),
              SizedBox(width: 5),
              Text('Cities'),
            ],
          ),
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.35,
            decoration:  BoxDecoration(
              image:  DecorationImage(
                image: NetworkImage(city.image),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: topContentText,
          ),
        ),
      ],
    ),
            Container(
              color: const Color.fromARGB(255, 239, 237, 218), // Couleur de fond jaune pâle
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    city.desc,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Couleur du texte en noir
                      fontWeight: FontWeight.bold, // Texte en gras
                    ),
                  ),
                  SizedBox(height: 20),
                  
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                     Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TransportPage(),
              ),
            );
                  },
                  icon: Icon(Icons.directions_car,color:Color.fromRGBO(101, 150, 137, 1) ),
                  label: Text('Transport',style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                      color: Color.fromRGBO(101, 150, 137, 1))
                      ),
                ),
                
                ElevatedButton.icon(
                  onPressed: () async {
                    List<Hotel> hotels = await HotelApi.getHotels(stadId);
                        Navigator.push(
                         context,
                     MaterialPageRoute(builder: (context) => HotelList(stadId: stadId, hotels: hotels)),
                     );
                  },
                  icon: Icon(Icons.hotel,color:Color.fromRGBO(101, 150, 137, 1) ),
                  label: Text('Hotels',style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                      color: Color.fromRGBO(101, 150, 137, 1))
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
