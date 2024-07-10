import 'package:cargo/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  var carList = <Car>[].obs;
  var brandedCarList = <Car>[].obs;
  var filteredCarList = <Car>[].obs;
  var selectedCar = Car().obs;
  var isLoading = true.obs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void fetchCars() async {
    isLoading(true);
    try {
      firebaseFirestore.collection('cars').snapshots().listen((snapshot) {
        var cars = snapshot.docs
            .map((doc) => Car.fromMap(doc.data(), doc.id))
            .toList();
        carList.assignAll(cars);
        isLoading(false);
      }, onError: (error) {
        print('Error fetching cars: $error');
        isLoading(false);
      });
    } catch (e) {
      print('Unexpected error: $e');
      isLoading(false);
    }
  }

  void fetchCarsByBrand(String brandId) async {
    isLoading(true);
    try {
      firebaseFirestore
          .collection('cars')
          .where('brandId', isEqualTo: brandId)
          .snapshots()
          .listen((snapshot) {
        var cars = snapshot.docs
            .map((doc) => Car.fromMap(doc.data(), doc.id))
            .toList();
        brandedCarList.assignAll(cars);
        filteredCarList.assignAll(cars);
        isLoading(false);
      }, onError: (error) {
        print('Error fetching cars by brand: $error');
        isLoading(false);
      });
    } catch (e) {
      print('Unexpected error: $e');
      isLoading(false);
    }
  }

  void fetchCarById(String carId) async {
    isLoading(true);
    try {
      DocumentSnapshot doc = await firebaseFirestore.collection('cars').doc(carId).get();
      if (doc.exists) {
        var car = Car.fromMap(doc.data() as Map<String, dynamic>, doc.id);
        selectedCar.value = car;
      } else {
        selectedCar.value = Car();
      }
    } catch (e) {
      print('Error fetching car by ID: $e');
    } finally {
      isLoading(false);
    }
  }

  void filterCars(String query) {
    if (query.isEmpty) {
      filteredCarList.assignAll(brandedCarList);
    } else {
      filteredCarList.assignAll(brandedCarList.where((car) =>
          car.carModel.toLowerCase().contains(query.toLowerCase())));
    }
  }
}
