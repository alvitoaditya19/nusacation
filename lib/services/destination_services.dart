part of 'services.dart';

class DestinationServices {
  CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  CollectionReference _hotelsReference =
      FirebaseFirestore.instance.collection('hotels');
  Future<List<DestinationModel>> getDestination() async {
    try {
      QuerySnapshot result = await _destinationReference.get();

      List<DestinationModel> destination = result.docs.map(
        (e) {
          return DestinationModel.fromJson(e.data() as Map<String, dynamic>);
        },
      ).toList();
      print(destination);
      return destination;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }

  Future<List<DestinationModel>> getHotels() async {
    try {
      QuerySnapshot result = await _hotelsReference.get();

      List<DestinationModel> hotels = result.docs.map(
        (e) {
          return DestinationModel.fromJson(e.data() as Map<String, dynamic>);
        },
      ).toList();
      print(hotels);
      return hotels;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }
}
