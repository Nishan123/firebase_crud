import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/screens/add_emp_screen.dart';
import 'package:firebase_crud/services/database.dart';
import 'package:firebase_crud/widgets.dart/edit_details.dart';
import 'package:firebase_crud/widgets.dart/emp_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();

  final ageController = TextEditingController();

  final addressController = TextEditingController();
  Stream? EmployeeStream;

  getontheload() async {
    EmployeeStream = await DatabaseMethods().getEmployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allEmployeeDetails() {
    return StreamBuilder(
        stream: EmployeeStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return EmpCard(
                        name: ds["Name"],
                        age: ds["Age"],
                        address: ds["Address"],
                        onPressedEdit: () {
                          nameController.text = ds["Name"];
                          ageController.text = ds["Age"];
                          addressController.text = ds["Address"];

                          EditEmployeeDetails(ds["Id"]);
                        });
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Firebase CRUD",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddEmpScreen()));
        },
        child: const Icon(Icons.person_add),
      ),
      body: Column(
        children: [
          Expanded(child: allEmployeeDetails()),
        ],
      ),
    );
  }

  Future EditEmployeeDetails(String id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
              content: EditDetails(
            nameController: nameController,
            ageController: ageController,
            addressController: addressController, Id: id,
          )));
}
