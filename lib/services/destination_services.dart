part of 'services.dart';

class DestinationServices {
  CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('destinations');
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
Stream<List<DestinationModel>> getSearch() {
    final stream = FirebaseFirestore.instance
                        .collection('destinations')
                        .snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return DestinationModel.fromJson(doc.data());
        }).toList());
  }

}
