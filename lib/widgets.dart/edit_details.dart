import 'package:firebase_crud/widgets.dart/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditDetails extends StatelessWidget {
  const EditDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    final ageController = TextEditingController();

    final addressController = TextEditingController();

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
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
              const Text("Edit Employee Details")
            ],
          ),
          CustomTextField(
              suffixIcon: Icons.person,
              hintText: "Name",
              controller: nameController),
          CustomTextField(
              suffixIcon: Icons.cake,
              hintText: "Age",
              controller: ageController),
          CustomTextField(
              suffixIcon: Icons.location_pin,
              hintText: "Address",
              controller: addressController),
        ],
      ),
    );
  }
}
