import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/network_response.dart';
import '../../models/user_model.dart';

class UserProfileRepository {
  Future<NetworkResponse> addUser(UserModel userModel) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("Users").get();

      List<UserModel> users = querySnapshot.docs
          .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      bool isExist = false;

      for (var user in users) {
        if (user.email == userModel.email) {
          isExist = true;
        }
      }

      if (isExist == false) {
        DocumentReference documentReference = await FirebaseFirestore.instance
            .collection("Users")
            .add(userModel.toJson());

        await FirebaseFirestore.instance
            .collection("Users")
            .doc(documentReference.id)
            .update({"userId": documentReference.id});
      }

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> updateUser(UserModel userModel) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userModel.userId)
          .update(userModel.toJsonForUpdate());

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> deleteUser(String docId) async {
    try {
      await FirebaseFirestore.instance.collection("Users").doc(docId).delete();

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> getUserByDocId(String docId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection("Users").doc(docId).get();

      return NetworkResponse(
        data: UserModel.fromJson(
          documentSnapshot.data() as Map<String, dynamic>,
        ),
      );
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> getUserByUid() async {
    NetworkResponse networkResponse = NetworkResponse();

    User? user = FirebaseAuth.instance.currentUser;
    String uid = "";
    if (user != null) {
      uid = user.uid;
    }

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .where("authUid", isEqualTo: uid)
          .get();

      List<UserModel> users = querySnapshot.docs
          .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      return NetworkResponse(
          data: users.isEmpty ? UserModel.initial() : users.first);
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }
}
