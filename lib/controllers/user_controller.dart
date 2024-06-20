import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:viver/custom_widgets/custom_timepicker.dart';
import 'package:viver/screens/sign.dart';
import 'package:viver/screens/sleep.dart';
import 'package:viver/screens/water.dart';

class UserController with ChangeNotifier {
  String? name = nameController.text;
  double? age = double.tryParse(ageController.text);
  double? weight = double.tryParse(weightController.text);
  String? wakeUpHour = wakeUpHourController.text;
  int? hourIdealSleepMax = hourIdealMax;
  double? waterIdeal =
      ((double.tryParse(weightController.text) ?? 0) * 0.350) / 10;

  UserController({
    name,
    age,
    weight,
    wakeUpHour,
    hourIdealSleepMax,
  });

  Future<void> setName() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .set({
        'name': name,
      }, SetOptions(merge: true));
    }
    notifyListeners();
  }

  Future<void> setAge() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .set({
        'age': age,
      }, SetOptions(merge: true));
    }
  }

  Future<void> setWeight() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .set({
        'weight': weight,
      }, SetOptions(merge: true));
    }
  }

  Future<void> setWakeUpHour() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .set({
        'wakeUpHour': wakeUpHour,
      }, SetOptions(merge: true));
    }
  }

  Future<void> setHourIdealSleepMax() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .set({
        'hourIdealSleepMax': hourIdealSleepMax,
      }, SetOptions(merge: true));
    }
  }

  Future<void> setWaterIdeal() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .collection('personalDatas')
          .doc('datas')
          .set({'waterIdeal': waterIdeal}, SetOptions(merge: true));
    }
  }
}
