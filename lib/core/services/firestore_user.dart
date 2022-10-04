import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mega_market/data/models/user_model.dart';

class FirestroreUser{
  final CollectionReference _userCollectionRef = FirebaseFirestore.instance.collection('user');
  Future<void> addUserToFireStore(UserModel userModel)async{
    return await _userCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }
}