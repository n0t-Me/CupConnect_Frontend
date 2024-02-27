import 'package:appcupconnect/views/transport.dart';
import 'package:flutter/material.dart';

class DiscoverCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://i.pinimg.com/474x/89/0a/00/890a00c476c3b6fa174c09b1faee8c99.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 3,
            ),
            Container(
              color: const Color.fromARGB(255, 239, 237, 218), // Couleur de fond jaune pâle
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Rabat(Arabic: الرباط) is the capital city of Morocco and the country\'s seventh-largest city with an urban population of approximately 580,000 (2014)[2] and a metropolitan population of over 1.2 million. It is also the capital city of the Rabat-Salé-Kénitra administrative region.[6] Rabat is located on the Atlantic Ocean at the mouth of the river Bou Regreg, opposite Salé, the city\'s main commuter town.Rabat was founded in the 12th century by the Almohads. The city grew at first but went into an extended period of decline following the collapse...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Couleur du texte en noir
                      fontWeight: FontWeight.bold, // Texte en gras
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Action when read more button is pressed
                        },
                        child: Text('Read More'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Action when maps button is pressed
                  },
                  icon: Icon(Icons.map),
                  label: Text('Maps'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TransportPage(),
              ),
            );
                  },
                  icon: Icon(Icons.directions_car),
                  label: Text('Transport'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Action when hotels button is pressed
                  },
                  icon: Icon(Icons.hotel),
                  label: Text('Hotels'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
