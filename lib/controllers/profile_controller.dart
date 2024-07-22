import 'package:cargo/views/auth/login_page.dart';
import 'package:get/get.dart';
import 'package:cargo/models/user.dart' as cargo;
import 'package:cargo/services/auth_service.dart';

enum ProfileTab {
  Favorite,
  Orders,
  Settings,
}

class ProfileController extends GetxController {
  var user = cargo.User(
    userId: '',
    userFirstname: '',
    userLastname: '',
    userGender: '',
    userEmail: '',
    userPhone: '',
    favoriteCars: [].obs,
  ).obs;
  var isLoading = true.obs;
  var activeTab = ProfileTab.Favorite.obs;

  final AuthService authService = Get.find();

  @override
  void onInit() {
    super.onInit();
    authService.loadUserFromPrefs().then((_) {
      user.value = authService.firestoreUser.value!;
    });
    authService.firestoreUser.listen((firestoreUser) {
      user.value = firestoreUser!;
    });
  }

  void openFavoriteTab() {
    activeTab.value = ProfileTab.Favorite;
  }

  void openEditTab() {
    activeTab.value = ProfileTab.Orders;
  }

  void openSettingsTab() {
    activeTab.value = ProfileTab.Settings;
  }

  void signOut() {
    try {
      authService.signOut();
      Get.offAll(const LoginPage());
    } catch (e) {
      print('Error updating user profile: $e');
    }
  }

  void updateUserProfile(cargo.User updatedUser) async {
    isLoading(true);
    try {
      await authService.firebaseFirestore
          .collection('users')
          .doc(updatedUser.userId)
          .set(updatedUser.toMap());
      user.value = updatedUser;
    } catch (e) {
      print('Error updating user profile: $e');
    } finally {
      isLoading(false);
    }
  }

  bool isFavorite(String carId) {
    return user.value.favoriteCars.contains(carId);
  }

  void addToFavorites(String carId) async {
    try {
      var updatedUser = user.value;
      if (!updatedUser.favoriteCars.contains(carId)) {
        updatedUser.favoriteCars.add(carId);
        updateUserProfile(updatedUser);
      }
    } catch (e) {
      print('Error adding car to favorites: $e');
    }
  }

  void removeFromFavorites(String carId) async {
    try {
      var updatedUser = user.value;
      if (updatedUser.favoriteCars.contains(carId)) {
        updatedUser.favoriteCars.remove(carId);
        updateUserProfile(updatedUser);
      }
    } catch (e) {
      print('Error removing car from favorites: $e');
    }
  }
}
