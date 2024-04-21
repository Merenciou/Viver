import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? name;
  double? weight;
  double? age;
  String? wakeUpHour;

  UserModel({
    name,
    weight,
    age,
    wakeUpHour,
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
}

// class UserTest extends StatefulWidget {
//   const UserTest({super.key});

//   @override
//   State<UserTest> createState() => _UserTestState();
// }

// class _UserTestState extends State<UserTest> {
//   Future<String?>? userName;

//   @override
//   void initState() {
//     userName = UserModel().getName();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder(
//             future: userName,
//             builder:
//                 (BuildContext context, AsyncSnapshot<String?> asyncSnapshot) {
//               if (asyncSnapshot.connectionState == ConnectionState.done) {
//                 return Text('${asyncSnapshot.data}');
//               } else {
//                 return const Text('Nada encontrado');
//               }
//             }),
//       ),
//     );
//   }
// }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';

// // class UserModel {
// //   String? name;
// //   int? weight;
// //   String? age;
// //   String? wakeUpHour;

// //   UserModel({
// //     name,
// //     weight,
// //     age,
// //     wakeUpHour,
// //   });

// //   void getName() async {
// //     final FirebaseFirestore firestore = FirebaseFirestore.instance;
// //     final FirebaseAuth auth = FirebaseAuth.instance;
// //     CollectionReference userCollection = firestore.collection('User');
// //     User? user = auth.currentUser;

// //     if (user != null) {
// //       await userCollection
// //           .doc(user.uid)
// //           .get()
// //           .then((DocumentSnapshot documentSnapshot) {
// //         if (documentSnapshot.exists) {
// //           Map<String, dynamic>? data =
// //               documentSnapshot.data() as Map<String, dynamic>;
// //           name = data['name'];
// //           print(name);
// //         } else {
// //           print('NOME NÃO ENCONTRADO');
// //         }
// //       });
// //     }
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserModel {
//   String? name;

//   UserModel({
//     name,
//   });

//   void getName() async {
//     final FirebaseFirestore firestore = FirebaseFirestore.instance;
//     final FirebaseAuth auth = FirebaseAuth.instance;
//     CollectionReference userCollection = firestore.collection('User');
//     User? user = auth.currentUser;

//     if (user != null) {
//       await userCollection
//           .doc(user.uid)
//           .get()
//           .then((DocumentSnapshot documentSnapshot) {
//         if (documentSnapshot.exists) {
//           Map<String, dynamic>? data =
//               documentSnapshot.data() as Map<String, dynamic>;

//           UserModel(name: data['name']);
//         } else {
//           print('NOME NÃO ENCONTRADO');
//         }
//       });
//     }
//   }
// }
