import 'package:firebase_crud/const/custom_style.dart';
import 'package:flutter/material.dart';

class EmpCard extends StatelessWidget {
  final String name;
  final String age;
  final String address;
  final VoidCallback onPressedEdit;
  final VoidCallback onPressedDelete;

  const EmpCard(
      {super.key,
      required this.name,
      required this.age,
      required this.address,
      required this.onPressedEdit,
      required this.onPressedDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      height: MediaQuery.of(context).size.height * 0.14,
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("Name: ", style: customStyle),
                      Text(
                        name,
                        style: customStyle,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Age: ", style: customStyle),
                      Text(
                        age,
                        style: customStyle,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Address: ",
                        style: customStyle,
                      ),
                      Text(
                        address,
                        style: customStyle,
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: onPressedEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
              IconButton(
                onPressed: onPressedDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
