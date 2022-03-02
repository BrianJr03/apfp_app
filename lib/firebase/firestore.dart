import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStore {
  static Stream<QuerySnapshot> getYTPlaylistIDs() {
    return FirebaseFirestore.instance
        .collection('youtube-playlists')
        .snapshots();
  }

  static Stream<QuerySnapshot> getYTVideoUrls() {
    return FirebaseFirestore.instance
        .collection('youtube-videos')
        .orderBy("id", descending: true)
        .snapshots();
  }

  static void storeUID(String docId, String uid) {
    FirebaseFirestore.instance
        .collection('registered-users')
        .doc(docId)
        .update({"UID": uid});
  }

  static Future<QuerySnapshot> getRegisteredUser(String email) {
    return FirebaseFirestore.instance
        .collection('registered-users')
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

  static DocumentReference<Map<String, dynamic>> getUserActivityDocument() {
    return FirebaseFirestore.instance
        .collection('activity')
        .doc(FirebaseAuth.instance.currentUser!.email.toString());
  }

  static CollectionReference<Map<String, dynamic>> getGoalLogCollection({required String goalType}) {
    return FirebaseFirestore.instance
        .collection('goal-logs')
        .doc(goalType)
        .collection(FirebaseAuth.instance.currentUser!.email.toString());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>>
      createUserActivityStream() {
    return getUserActivityDocument().snapshots();
  }

  static Future<void> updateWorkoutData(Map<String, dynamic> data) {
    return getUserActivityDocument().set(data);
  }

  static void createUserActivityDocument() async {
    await FirebaseFirestore.instance
        .collection('activity')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set(new Map());
  }

  static DocumentReference<Map<String, dynamic>> getHealthDocument() {
    return FirebaseFirestore.instance
        .collection('health')
        .doc(FirebaseAuth.instance.currentUser!.email.toString());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>>
      createHealthDocStream() {
    return getHealthDocument().snapshots();
  }

  static Future<void> updateHealthData(Map<String, dynamic> data) {
    return getHealthDocument().update(data);
  }

  static void createHealthDocument() async {
    await FirebaseFirestore.instance
        .collection('health')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set({
      "isHealthTrackerPermissionGranted": false,
      "isDailyDisplayed": true,
      "isExerciseTimeGoalSet": false,
      "isCalGoalSet": false,
      "isStepGoalSet": false,
      "isMileGoalSet": false,
      "isCyclingGoalSet": false,
      "isRowingGoalSet": false,
      "isStepMillGoalSet": false,
      "isExerciseTimeGoalSet_w": false,
      "exerciseTimeGoalProgress": 0,
      "exerciseTimeGoalProgress_w": 0,
      "exerciseTimeEndGoal": 0,
      "exerciseTimeEndGoal_w" : 0,
      "calGoalProgress": 0,
      "calEndGoal": 0,
      "stepGoalProgress": 0,
      "stepEndGoal": 0,
      "mileGoalProgress": 0,
      "mileEndGoal": 0,
      "cyclingGoalProgress": 0,
      "cyclingEndGoal": 0,
      "rowingGoalProgress": 0,
      "rowingEndGoal": 0,
      "stepMillGoalProgress": 0,
      "stepMillEndGoal": 0,
      "dayOfMonth": DateTime.now().day
    });
  }

  static void resetHealthDoc(bool healthPermission, bool dailyDisplayed) {
    updateHealthData({
     "isHealthTrackerPermissionGranted": healthPermission,
      "isDailyDisplayed": dailyDisplayed,
      "isExerciseTimeGoalSet": false,
      "isCalGoalSet": false,
      "isStepGoalSet": false,
      "isMileGoalSet": false,
      "isCyclingGoalSet": false,
      "isRowingGoalSet": false,
      "isStepMillGoalSet": false,
      "isExerciseTimeGoalSet_w": false,
      "exerciseTimeGoalProgress": 0,
      "exerciseTimeGoalProgress_w": 0,
      "exerciseTimeEndGoal": 0,
      "exerciseTimeEndGoal_w" : 0,
      "calGoalProgress": 0,
      "calEndGoal": 0,
      "stepGoalProgress": 0,
      "stepEndGoal": 0,
      "mileGoalProgress": 0,
      "mileEndGoal": 0,
      "cyclingGoalProgress": 0,
      "cyclingEndGoal": 0,
      "rowingGoalProgress": 0,
      "rowingEndGoal": 0,
      "stepMillGoalProgress": 0,
      "stepMillEndGoal": 0,
      "dayOfMonth": DateTime.now().day
    });
  }

  static Map<String, dynamic> healthPermissionToMap(bool permission) {
    return {
      "isHealthTrackerPermissionGranted": permission,
    };
  }

  static Map<String, dynamic> exerciseGoalBoolToMap(bool isExerciseGoalSet) {
    return {
      "isExerciseTimeGoalSet": isExerciseGoalSet,
    };
  }

  static Map<String, dynamic> calGoalBoolToMap(bool isCalGoalSet) {
    return {
      "isCalGoalSet": isCalGoalSet,
    };
  }

  static Map<String, dynamic> stepGoalBoolToMap(bool isStepGoalSet) {
    return {
      "isStepGoalSet": isStepGoalSet,
    };
  }

  static Map<String, dynamic> mileGoalBoolToMap(bool isMileGoalSet) {
    return {
      "isMileGoalSet": isMileGoalSet,
    };
  }

  static Map<String, dynamic> mileProgressToMap(double mileProgress) {
    return {
      "mileGoalProgress": mileProgress,
    };
  }

  static Map<String, dynamic> mileEndGoalToMap(double miles) {
    return {
      "mileEndGoal": miles,
    };
  }

  static Map<String, dynamic> stepProgressToMap(double stepProgress) {
    return {
      "stepGoalProgress": stepProgress,
    };
  }

  static Map<String, dynamic> stepEndGoalToMap(double stepCount) {
    return {
      "stepEndGoal": stepCount,
    };
  }

  static Map<String, dynamic> calProgressToMap(double calProgress) {
    return {
      "calGoalProgress": calProgress,
    };
  }

  static Map<String, dynamic> calEndGoalToMap(double calsBurned) {
    return {
      "calEndGoal": calsBurned,
    };
  }

  static Map<String, dynamic> exerciseTimeProgressToMap(
      double exerciseTimeProgress) {
    return {
      "exerciseTimeGoalProgress": exerciseTimeProgress,
    };
  }

  static Map<String, dynamic> exerciseTimeEndGoalToMap(double minutes) {
    return {
      "exerciseTimeEndGoal": minutes,
    };
  }
}
