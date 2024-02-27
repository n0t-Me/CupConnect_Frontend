import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/hotel.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchURL(url);
  } else {
    throw 'Could not launch $url';
  }
}

class HotelDetails extends StatelessWidget {
  final Hotel hotel;

  const HotelDetails({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 100.0),
        const Icon(
          Icons.hotel,
          color: Colors.white,
          shadows: [Shadow(color: Colors.black, blurRadius: 10)],
          size: 40.0,
        ),
        SizedBox(
          width: 90.0,
          child: Divider(color: Colors.yellow),
        ),
        const SizedBox(height: 10.0),
        Text(
          hotel.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            shadows: [Shadow(color: Colors.black, blurRadius: 10)], 
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    hotel.review.toString(), // Review
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.attach_money,
                    color: Colors.yellow,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '${hotel.minPrice} - ${hotel.maxPrice}', // Min Price - Max Price
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(hotel.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: topContentText,
          ),
        ),
      ],
    );
// Assuming hotel.properties is a string representing a list
String propertiesString = hotel.properties;
List<String> properties = propertiesString.split(',').map((e) => e.trim().replaceAll(RegExp(r"[\[\]']"), "")).toList();

    final bottomContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address: ${hotel.address}',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        Center(
       child:ListView.builder(
      shrinkWrap: true,
      itemCount: properties.length,
      itemBuilder: (context, index) {
        String property = properties[index];
        return Row(
          children: [
           const  Icon(Icons.check,color: Color.fromRGBO(120, 178, 163, 1), size: 30, weight: 50,), // Icon for each property
            SizedBox(width: 5),
            Text(property, style: TextStyle(fontSize: 20.0,color: Colors.black,)), // Text for each property
          ],
        );
      },
    )),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            // Handle map tap
          },
          child: Text(
            'Map: ${hotel.map}',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );

    final bottomContent = SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
            padding:  EdgeInsets.only(left: 30.0),           
            child: Row( children: [
              Image(
                    height: 70,
                    width: 70,
                    image: AssetImage('lib/assets/logo2.png')),
        Text('Hotel Details'),
             ],
          ),
      )),
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
//bbb