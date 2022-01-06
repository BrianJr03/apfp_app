import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:apfp/firebase/fire_auth.dart';

class FireStore {
  static Future<QuerySnapshot> getPlaylistID() {
    return FirebaseFirestore.instance.collection('youtube playlist ids').get();
  }

  static void storeUID(String doc_id, String uid) {
    FirebaseFirestore.instance
        .collection('registered users')
        .doc(doc_id)
        .update({"UID": uid});
  }

  static Future<QuerySnapshot> getRegisteredUser(String email) {
    FireAuth.showToast("Verifying Membership...");
    return FirebaseFirestore.instance
        .collection('registered users')
        .where('email', isEqualTo: email)
        .get();
  }

  static Future<QuerySnapshot> getAnnouncements() {
    return FirebaseFirestore.instance
        .collection('announcements')
        .orderBy("id", descending: true)
        .get();
  }
}
