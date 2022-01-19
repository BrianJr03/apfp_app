import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  static Future<QuerySnapshot> getPlaylistIDs() {
    return FirebaseFirestore.instance
        .collection('youtube playlist ids')
        .orderBy("Title")
        .get();
  }

  static Future<QuerySnapshot> getVideoUrls() {
    return FirebaseFirestore.instance
        .collection('youtube video urls')
        .orderBy("Title")
        .get();
  }

  static void storeUID(String docId, String uid) {
    FirebaseFirestore.instance
        .collection('registered users')
        .doc(docId)
        .update({"UID": uid});
  }

  static Future<QuerySnapshot> getRegisteredUser(String email) {
    return FirebaseFirestore.instance
        .collection('registered users')
        .where('email', isEqualTo: email)
        .get();
  }

  static Future<QuerySnapshot> getAdminEmails() async {
    return FirebaseFirestore.instance.collection('admins').get();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAnnouncements(
      {int limit = 20}) {
    return FirebaseFirestore.instance
        .collection('announcements')
        .orderBy("id", descending: true)
        .limit(limit)
        .snapshots();
  }
}
