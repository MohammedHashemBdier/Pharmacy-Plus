import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/models/medicine_model.dart';

class MedicineController extends GetxController {
  List<MedicineModel> medicines = [];
  List<MedicineModel> filteredMedicines = [];
  TextEditingController searchController = TextEditingController();

  @override
  void onReady() {
    super.onReady();

    fetchMedicines();
    filterMedicine();
    searchController.addListener(() => filterMedicine());
  }

  void fetchMedicines() {
    medicines = [
      MedicineModel(
        id: 1,
        scientificName: 'fjelks',
        commercialName: 'jelce',
        category: 'sefce',
        manufacturer: 'fesagr',
        quantity: 10,
        expiryDate: DateTime(DateTime.may),
        price: 100,
      ),
      MedicineModel(
        id: 1,
        scientificName: 'jfls',
        commercialName: 'ivjel',
        category: 'veilj',
        manufacturer: 'fesagr',
        quantity: 10,
        expiryDate: DateTime(DateTime.may),
        price: 100,
      ),
      MedicineModel(
        id: 1,
        scientificName: 'ivels',
        commercialName: 'jvle',
        category: 'jlef',
        manufacturer: 'fesagr',
        quantity: 10,
        expiryDate: DateTime(DateTime.may),
        price: 100,
      ),
      MedicineModel(
        id: 1,
        scientificName: 'jvile',
        commercialName: 'lmvi',
        category: 'fviel',
        manufacturer: 'fesagr',
        quantity: 10,
        expiryDate: DateTime(DateTime.may),
        price: 100,
      ),
      MedicineModel(
        id: 1,
        scientificName: 'همرث',
        commercialName: 'تمهرث',
        category: 'تنمتبثه',
        manufacturer: 'fesagr',
        quantity: 10,
        expiryDate: DateTime(DateTime.may),
        price: 100,
      ),
    ];
  }

  void filterMedicine() {
    filteredMedicines = medicines
        .where((medicine) =>
            medicine.scientificName!.contains(searchController.text) ||
            medicine.commercialName!.contains(searchController.text) ||
            medicine.category!.contains(searchController.text))
        .toList();
    update();
  }
}
