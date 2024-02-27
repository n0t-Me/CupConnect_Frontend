class City {
  final int id;
  final String name;
  final String desc;
  final int population;
  final String transport;
  final String image;

  City({
    required this.id,
    required this.name,
    required this.desc,
    required this.population,
    required this.transport,
    required this.image,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as int,
      name: json['name'] as String,
      desc: json['desc'] as String,
      population: json['population'] as int,
      transport: json['transport'] as String,
      image: json['image'] as String,
    );
  }
}
