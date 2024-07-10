import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);
  Rx<Map<String, dynamic>?> firestoreUser = Rx<Map<String, dynamic>?>(null);

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
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    if (user != null) {
      await firebaseFirestore.collection('users').doc(user.uid).set(userDetails);
      _setFirestoreUser(user);
    }
  }

  Future<void> _setFirestoreUser(User? user) async {
    if (user != null) {
      DocumentSnapshot userDoc = await firebaseFirestore.collection('users').doc(user.uid).get();
      firestoreUser.value = userDoc.data() as Map<String, dynamic>?;
    } else {
      firestoreUser.value = null;
    }
  }
}