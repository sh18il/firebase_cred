import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addDetails(Map<String, dynamic> detalsMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("details")
        .doc(id)
        .set(detalsMap);
  }

  Future<Stream<QuerySnapshot>> getDetails() async {
    return await FirebaseFirestore.instance.collection("details").snapshots();
  }

  Future updateData(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("details")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteData(String id) async {
    return await FirebaseFirestore.instance
        .collection("details")
        .doc(id).delete()
        ;
  }
}
