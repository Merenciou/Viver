import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? name;
  double? weight;
  double? age;
  String? wakeUpHour;
  int? hourIdealSleepMax;

  UserModel({
    name,
    weight,
    age,
    wakeUpHour,
    hourIdealSleepMax,
  });

  Future<String?> getName() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('User');

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          name = data['name'];
        }
      });
    }

    return name;
  }

  Future<double?> getWeight() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('User');

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          weight = data['weight'];
        }
      });
    }

    return weight;
  }

  Future<double?> getAge() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('User');

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          age = data['age'];
        }
      });
    }

    return age;
  }

  Future<String?> getWakeUpHour() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('User');

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          wakeUpHour = data['wakeUpHour'];
        }
      });
    }

    return wakeUpHour;
  }

  Future<int?> getHourIdealSleepMax() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('User');

    if (user != null) {
      await userCollection
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          hourIdealSleepMax = data['hourIdealSleepMax'];
        }
      });
    }

    return hourIdealSleepMax;
  }
}
