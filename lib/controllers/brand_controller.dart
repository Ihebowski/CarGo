import 'package:cargo/models/brand.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  var brandList = <Brand>[].obs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    firebaseFirestore.collection('brands').snapshots().listen((snapshot) {
      var brands = snapshot.docs.map((doc) => Brand.fromMap(doc.data(), doc.id)).toList();
      brandList.assignAll(brands);
    });
  }
}