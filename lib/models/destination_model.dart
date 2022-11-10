class DestinationModel {
  final int? id;
  final String? name;
  final String? imageUrl;
  final String? city;
  final String? location;
  final double? rating;
  final int? price;

  DestinationModel({
    required this.id,
    required this.name,
   required  this.imageUrl,
    required this.city,
    required this.location,
    this.rating = 0.0,
    this.price = 0,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      imageUrl: json['imageUrl'],
      city: json['city'],
      location: json['location'],
      rating: json['rating'].toDouble(),
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'city': city,
      'location': location,
      'rating': rating,
      'price': price,
    };
  }
}

