import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/studium.dart';
import 'package:url_launcher/url_launcher.dart';
Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchURL(url);
  } else {
    throw 'Could not launch $url';
  }
}
class StudiumDetails extends StatelessWidget {
  final Studium studium;

  const StudiumDetails({Key? key, required this.studium}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final coursePrice = Align(
  alignment: Alignment.bottomLeft,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjusted to space between the two containers
    children: [
      Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.fromLTRB(10, 10, 140, 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(
              Icons.people,
              color: Colors.yellow,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              studium.capacity.toString(),
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
              Icons.monetization_on_rounded,
              color: Colors.yellow,
              size: 18,
            ),
            SizedBox(width: 10),
            Text(
              '${studium.cost} dh',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ],
  ),
);


    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 100.0),
        const Icon(
          Icons.sports_soccer,
          color: Colors.white,
          size: 40.0,
        ),
        SizedBox(
          width: 90.0,
          child: new Divider(color: Colors.yellow),
        ),
        const SizedBox(height: 10.0),
        Text(
          studium.name,
          style: TextStyle(color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            coursePrice,
          ],
        ),
         ],
    );
    
      final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.35,
            decoration:  BoxDecoration(
              image:  DecorationImage(
                image: NetworkImage(studium.picture.main),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: topContentText,
          ),
        ),
      ],
    );

    final bottomContentText = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Location: ${studium.city}, ${studium.country}',
      style: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 15), // Add some space between location and description
    Text(
      studium.desc,
      style: TextStyle(fontSize: 18.0, color: Colors.black),
    ),
    SizedBox(height: 15),
    GestureDetector(
      onTap: () {
          //launchURL(studium.map); 
          },
      child: Text(
          'Map: ${studium.map}',
          style: TextStyle(fontSize: 15.0, color: Colors.blue, fontWeight: FontWeight.bold),
  ),
    ),
  ],
);
    final readButton = Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
                 backgroundColor: Color.fromRGBO(120, 178, 163, 1),
            ),
          child:
              const Text("See Nearest Hotels", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Expanded(
  child:SingleChildScrollView(
  child:Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    ),
    ),
    );
    
    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studiums'),
      ),
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
/*appBar: AppBar(
        title: Text(studium.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              studium.picture.main,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16, width: 15,),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              studium.desc,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text('Name: ${studium.name}'),
           const Text(
              'Location:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
            ),
            Text(
              '${studium.country}, ${studium.city}',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            // Add more details as needed
          ],
        ),
      ),*/