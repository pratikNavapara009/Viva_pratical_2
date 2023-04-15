import 'package:cloud_firestore/cloud_firestore.dart';

class Global {
  static int bjp = 2000;
  static int cong = 1500;
  static int aap = 800;
  static int other = 300;
  static bool voted = false;
  static List<QueryDocumentSnapshot<Map<String, dynamic>>> allDocs = [];
}