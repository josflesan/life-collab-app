import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String uid;
  String email;
  String fullName;
  String profilePic;
  Timestamp accountCreated;
  String groupId;

  OurUser({
    this.uid,
    this.email,
    this.fullName,
    this.profilePic,
    this.accountCreated,
    this.groupId,
  });
}
