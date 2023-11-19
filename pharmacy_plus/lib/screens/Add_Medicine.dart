import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_plus/constants/App_Bar.dart';
import 'package:pharmacy_plus/constants/App_Colors.dart';
import 'package:pharmacy_plus/screens/Home.dart';
import 'package:flutter/services.dart';

class AddMedicine extends StatefulWidget {
  @override
  Add_Medicine createState() => Add_Medicine();
}

class Add_Medicine extends State<AddMedicine> {
  TextEditingController scientificNameController = TextEditingController();
  TextEditingController tradeNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('the scientific name'.tr),
              TextField(
                controller: scientificNameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: app_Colors.c2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text("trade name".tr),
              TextField(
                controller: tradeNameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: app_Colors.c2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text('category'.tr),
              TextField(
                controller: categoryController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: app_Colors.c2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text('the manufacture company'.tr),
              TextField(
                controller: companyController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: app_Colors.c2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text('quantity'.tr),
              TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter a value'.tr;
                  }
                  if (int.tryParse(value) == null) {
                    return 'value must contain numbers only'.tr;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: app_Colors.c2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text('expiration date'.tr),
              TextFormField(
                controller: expiryController,
                textDirection: TextDirection.rtl,
                readOnly: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: app_Colors.c2,
                    ),
                  ),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () {
                  _selectDate(context);
                },
              ),
              SizedBox(height: 16.0),
              Text('the price'.tr),
              TextFormField(
                controller: priceController,
                textDirection: TextDirection.rtl,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter a value'.tr;
                  }
                  if (int.tryParse(value) == null) {
                    return 'value must contain numbers only'.tr;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: app_Colors.c2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  addMedicine();
                  Get.off(Home());
                },
                child: Text('add medication'.tr),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    app_Colors.c2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addMedicine() {
//هون فيك ترسل الدواء الى الباك اند
  }
}

Future<void> _selectDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();

  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
  );

  if (picked != null && picked != selectedDate) {
    // إذا تم اختيار تاريخ، قم بتحديث القيمة في الحقل
  }
  ;
}
