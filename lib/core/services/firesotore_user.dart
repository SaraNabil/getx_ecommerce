import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_ecommerce/model/user_model.dart';

class FirestoreUser {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirestore(UserModel user) async {
    await _userCollectionReference.doc(user.userId).set(user.toJson());
  }
}
