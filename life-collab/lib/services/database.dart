import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_collab/models/user.dart';

class OurDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection("users").doc(user.uid).set({
        'fullName': user.fullName,
        'email': user.email,
        'profilePic': user.profilePic,
        'accountCreated': Timestamp.now(),
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();

    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("users").doc(uid).get();
      retVal.uid = uid;
      retVal.fullName = _docSnapshot["fullName"];
      retVal.email = _docSnapshot["email"];
      retVal.profilePic = _docSnapshot["profilePic"];
      retVal.accountCreated = _docSnapshot["accountCreated"];
      retVal.groupId = _docSnapshot["groupId"];
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}
