import 'package:firebase_crud/services/database.dart';
import 'package:firebase_crud/widgets.dart/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddEmpScreen extends StatefulWidget {
  const AddEmpScreen({super.key});

  @override
  State<AddEmpScreen> createState() => _AddEmpScreenState();
}

class _AddEmpScreenState extends State<AddEmpScreen> {
  final nameController = TextEditingController();

  final ageController = TextEditingController();

  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Employee Form",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              suffixIcon: Icons.person,
              hintText: 'Name',
              controller: nameController,
            ),
            CustomTextField(
              suffixIcon: Icons.cake,
              hintText: 'Age',
              controller: ageController,
            ),
            CustomTextField(
              suffixIcon: Icons.location_pin,
              hintText: 'Address',
              controller: addressController,
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  String Id = randomAlphaNumeric(10);
                  Map<String, dynamic> employeeInfoMap = {
                    "Name": nameController.text,
                    "Age": ageController.text,
                    "Address": addressController.text,
                    "Id": Id,
                  };
                  await DatabaseMethods()
                      .addEmployeeDetails(employeeInfoMap, Id);
                  const snackBar = SnackBar(
                    content: Text('Data Added Successfully'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero)), // Add this line
                ),
                child: const Text(
                  "Add Employee",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
