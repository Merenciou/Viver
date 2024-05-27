import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChartModel {
  double? monday;
  double? tuesday;
  double? wednesday;
  double? thursday;
  double? friday;
  double? saturday;
  double? sunday;

  ChartModel({
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
          .collection('waterIngestedPerDay')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          monday = data['monday'];
        } else {
          monday = 1;
        }
        return monday;
      });
    } else {
      return Stream.value(1);
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
          .collection('waterIngestedPerDay')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          tuesday = data['tuesday'];
        } else {
          tuesday = 1;
        }
        return tuesday;
      });
    } else {
      return Stream.value(1);
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
          .collection('waterIngestedPerDay')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          wednesday = data['wednesday'];
        } else {
          wednesday = 1;
        }
        return wednesday;
      });
    } else {
      return Stream.value(1);
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
          .collection('waterIngestedPerDay')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          thursday = data['thursday'];
        } else {
          thursday = 1;
        }
        return thursday;
      });
    } else {
      return Stream.value(1);
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
          .collection('waterIngestedPerDay')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          friday = data['friday'];
        } else {
          friday = 1;
        }
        return friday;
      });
    } else {
      return Stream.value(1);
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
          .collection('waterIngestedPerDay')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          saturday = data['saturday'];
        } else {
          saturday = 1;
        }
        return saturday;
      });
    } else {
      return Stream.value(1);
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
          .collection('waterIngestedPerDay')
          .doc('days')
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          sunday = data['sunday'];
        } else {
          sunday = 1;
        }
        return sunday;
      });
    } else {
      return Stream.value(1);
    }
  }
}
