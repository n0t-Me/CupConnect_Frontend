import 'package:flutter/material.dart';

class TransportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
            padding:  EdgeInsets.only(left: 40.0),           
            child: Row( children: [
              Image(
                    height: 70,
                    width: 70,
                    image: AssetImage('lib/assets/logo2.png')),
              SizedBox(width: 5),
              Text('Transport'),
            ],
          ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Transports',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                children: [
                  _buildTransportItem(
                    context,
                    'Bus',
                    'https://i.pinimg.com/564x/aa/91/6e/aa916e8240a8049c9e45c36fb43cecb5.jpg',
                  ),
                  _buildTransportItem(
                    context,
                    'Train',
                    'https://i.pinimg.com/564x/a5/51/a9/a551a997ff4d265a201de161a85fa727.jpg',
                  ),
                  _buildTransportItem(
                    context,
                    'Taxi',
                    'https://i0.wp.com/leseco.ma/wp-content/uploads/2020/02/taxis-rabat-1.jpg?fit=800%2C600&ssl=1',
                  ),
                  _buildTransportItem(
                    context,
                    'Trame',
                    'https://i.pinimg.com/564x/ab/9e/32/ab9e32134c077422f8bf244c3d5bd83b.jpg',
                  ),
                  _buildTransportItem(
                    context,
                    'BusWay',
                    'https://i.pinimg.com/564x/ab/9e/32/ab9e32134c077422f8bf244c3d5bd83b.jpg',
                  ),
                  _buildTransportItem(
                    context,
                    'Taxi 2',
                    'https://www.bladi.net/img/logo/grands-taxis-nombre-passagers.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransportItem(
    BuildContext context,
    String name,
    String imageUrl,
  ) {
    return Container(
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          // Action lorsque l'image est cliquée (navigation vers la page de détails)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransportDetailsPage(name: name),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransportDetailsPage extends StatelessWidget {
  final String name;

  const TransportDetailsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text(
          'Détails de $name',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
