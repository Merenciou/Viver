import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChartSleepModel {
  double? monday;
  double? tuesday;
  double? wednesday;
  double? thursday;
  double? friday;
  double? saturday;
  double? sunday;

  ChartSleepModel({
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
  });

  Stream<double?> getMonday() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      return userCollection
          .doc(user.uid)
          .collection('hourSleptPerday')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          monday = double.tryParse(data['monday']);
        } else {
          monday = 0;
        }

        return monday;
      });
    } else {
      return Stream.value(0);
    }
  }

  Stream<double?> getTuesday() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      return userCollection
          .doc(user.uid)
          .collection('hourSleptPerday')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          tuesday = double.tryParse(data['tuesday']);
        } else {
          tuesday = 0;
        }

        return tuesday;
      });
    } else {
      return Stream.value(0);
    }
  }

  Stream<double?> getWednesday() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      return userCollection
          .doc(user.uid)
          .collection('hourSleptPerday')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          wednesday = double.tryParse(data['wednesday']);
        } else {
          wednesday = 0;
        }

        return wednesday;
      });
    } else {
      return Stream.value(0);
    }
  }

  Stream<double?> getThursday() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      return userCollection
          .doc(user.uid)
          .collection('hourSleptPerday')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          thursday = double.tryParse(data['thursday']);
        } else {
          thursday = 0;
        }

        return thursday;
      });
    } else {
      return Stream.value(0);
    }
  }

  Stream<double?> getFriday() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      return userCollection
          .doc(user.uid)
          .collection('hourSleptPerday')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          friday = double.tryParse(data['friday']);
        } else {
          friday = 0;
        }

        return friday;
      });
    } else {
      return Stream.value(0);
    }
  }

  Stream<double?> getSaturday() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      return userCollection
          .doc(user.uid)
          .collection('hourSleptPerday')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          saturday = double.tryParse(data['saturday']);
        } else {
          saturday = 0;
        }

        return saturday;
      });
    } else {
      return Stream.value(0);
    }
  }

  Stream<double?> getSunday() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    CollectionReference userCollection = firestore.collection('Users');

    if (user != null) {
      return userCollection
          .doc(user.uid)
          .collection('hourSleptPerday')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          sunday = double.tryParse(data['sunday']);
        } else {
          sunday = 0;
        }

        return sunday;
      });
    } else {
      return Stream.value(0);
    }
  }
}
