import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:get/get.dart';
import 'package:cargo/models/user.dart' as cargo;

class AuthService extends GetxService {
  final firebase.FirebaseAuth firebaseAuth = firebase.FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Rx<firebase.User?> firebaseUser = Rx<firebase.User?>(null);
  Rx<cargo.User?> firestoreUser = Rx<cargo.User?>(null);
  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(firebaseAuth.userChanges());
    ever(firebaseUser, _setFirestoreUser);
  }

  Future<void> signIn(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> register(String email, String password, Map<String, dynamic> userDetails) async {
    firebase.UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    firebase.User? user = userCredential.user;

    if (user != null) {
      await firebaseFirestore.collection('users').doc(user.uid).set(userDetails);
      await _setFirestoreUser(user);
    }
  }

  Future<void> _setFirestoreUser(firebase.User? user) async {
    if (user != null) {
      DocumentSnapshot userDoc = await firebaseFirestore.collection('users').doc(user.uid).get();
      firestoreUser.value = cargo.User.fromMap(userDoc.data() as Map<String, dynamic>, user.uid);
    } else {
      firestoreUser.value = null;
    }
  }
}