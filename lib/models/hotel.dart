class Hotel {
  final int id;
  final String name;
  final String properties;
  final int minPrice;
  final int maxPrice;
  final String address;
  final double review;
  final String image;
  final String map;
  final int hotelId;

  Hotel({
    required this.id,
    required this.name,
    required this.properties,
    required this.minPrice,
    required this.maxPrice,
    required this.address,
    required this.review,
    required this.image,
    required this.map,
    required this.hotelId,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'] as int,
      name: json['name'] as String,
      properties: json['properties'] as String,
      minPrice: json['min_price'] as int,
      maxPrice: json['max_price'] as int,
      address: json['address'] as String,
      review: json['review'] as double,
      image: json['image'] as String,
      map: json['map'] as String,
      hotelId: json['hotel_id'] as int,
    );
  }
}
