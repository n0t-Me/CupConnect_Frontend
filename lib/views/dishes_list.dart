import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/dishes.dart';
import 'package:flutter_application_1/views/Widgets/dish_card.dart';

class DishesList extends StatelessWidget {
  final String cityName;
  final List<Dish> dishes;

  const DishesList({Key? key, required this.cityName, required this.dishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60.0),           
          child: Row(
            children: [
              Image(
                height: 70,
                width: 70,
                image: AssetImage('lib/assets/logo2.png')),
              SizedBox(width: 5),
              Text('Dishes'),
            ],
          ),
        ),
      ),
      body: ListView.builder(
    itemCount: dishes.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          // Handle onTap event here
        },
        child: DishCard(
          title: dishes[index].name,
          description: dishes[index].desc,
          imageUrl: dishes[index].image,
        ),
      );
    },
  ),
);
  }
}
