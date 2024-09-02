import 'package:firebase_crud/services/database.dart';
import 'package:firebase_crud/widgets.dart/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditDetails extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController addressController;
  final String id;

  const EditDetails({
    super.key,
    required this.nameController,
    required this.ageController,
    required this.addressController,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel)),
              const SizedBox(
                height: 20,
              ),
               Text(id)
            ],
          ),
          CustomTextField(
            suffixIcon: Icons.person,
            hintText: "Name",
            controller: nameController,
          ),
          CustomTextField(
              suffixIcon: Icons.cake,
              hintText: "Age",
              controller: ageController),
          CustomTextField(
              suffixIcon: Icons.location_pin,
              hintText: "Address",
              controller: addressController),
          const SizedBox(height: 20),

          // Save changes button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> updateInfo = {
                  "Id": id,
                  "Name": nameController.text,
                  "Age": ageController.text,
                  "Address": addressController.text
                };
                await DatabaseMethods()
                    .updateEmployeeDetail(id, updateInfo)
                    .then((value) => Navigator.pop(context));
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red),
                elevation: WidgetStateProperty.all(0),
                shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero)), // Add this line
              ),
              child: const Text(
                "Save Changes",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
