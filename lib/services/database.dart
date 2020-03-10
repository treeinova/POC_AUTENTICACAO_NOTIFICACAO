import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseauth/models/firebase.dart';


class DataBaseService{

  final String uid;

  DataBaseService({this.uid});

// collection reference
final CollectionReference fireBaseCollection = Firestore.instance.collection("FireBase");


Future updateUserData(String sugars,String name, int strength) async{
return await fireBaseCollection.document(uid).setData({
  "sugars": sugars,
  "name": name,
  "strength": strength,
});

}

//Firebase list from snapshot
List<FireBase> _fireBaseListFromSnapshot(QuerySnapshot snapshot){
  return snapshot.documents.map((doc){
    return FireBase(
      name: doc.data["name"] ?? "",
      strength: doc.data ["strength"] ?? 0,
      sugars: doc.data["sugars"] ?? "0",
    );
  }).toList();
}

// get firebase stream

Stream<List<FireBase>> get fireBase{
  return fireBaseCollection.snapshots()
  .map(_fireBaseListFromSnapshot);
}

}