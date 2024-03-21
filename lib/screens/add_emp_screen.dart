import 'package:firebase_crud/widgets.dart/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddEmpScreen extends StatelessWidget {
  const AddEmpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Add Employee",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              suffixIcon: Icons.person,
              hintText: 'Name',
            ),
            CustomTextField(
              suffixIcon: Icons.cake,
              hintText: 'Age',
            ),
            CustomTextField(
              suffixIcon: Icons.location_pin,
              hintText: 'Address',
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Add Employee",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero)), // Add this line
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
