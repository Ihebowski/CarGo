import 'package:cargo/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  var selectedCar = Car().obs;
  var isLoading = true.obs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


}