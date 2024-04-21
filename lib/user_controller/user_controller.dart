import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:viver/custom_widgets/custom_timepicker.dart';
import 'package:viver/screens/sign.dart';
import 'package:viver/screens/sleep.dart';
import 'package:viver/screens/water.dart';

class UserController {
  String? name = nameController.text;
  double? weight = double.tryParse(weightController.text);
  double? age = double.tryParse(ageController.text.replaceAll(',', '.'));
  String? wakeUpHour = wakeUpHourController.text;
  // int? hourSleepIdeal = const Sleep().hourIdealMax;

  UserController({
    name,
    weight,
    age,
    wakeUpHour,
    // hourSleepIdeal,
  });

  void setName() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userCollection = firestore.collection('User');

    auth.authStateChanges().listen((User? user) {
      user = auth.currentUser;
      if (user != null) {
        userCollection.doc(user.uid).set({
          'name': name,
        });
      }
    });
  }

  void setWeight() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userCollection = firestore.collection('User');

    if (user != null) {
      await userCollection.doc(user.uid).update({
        'weight': weight,
      });
    }
  }

  void setAge() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userCollection = firestore.collection('User');

    if (user != null) {
      await userCollection.doc(user.uid).update({
        'age': age,
      });
    }
  }

  void setWakeUpHour() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userCollection = firestore.collection('User');

    if (user != null) {
      await userCollection.doc(user.uid).update({
        'wakeUpHour': wakeUpHour,
      });
    }
  }

  // void setSleepHourIdeal() async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   User? user = auth.currentUser;
  //   CollectionReference userCollection = firestore.collection('User');

  //   if (user != null) {
  //     await userCollection.doc(user.uid).update({
  //       'hourSleepIdeal': hourSleepIdeal,
  //     });
  //   }
  // }
}
