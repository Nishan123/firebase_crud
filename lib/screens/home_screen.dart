import 'package:firebase_crud/screens/add_emp_screen.dart';
import 'package:firebase_crud/widgets.dart/emp_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          EmpCard(name: 'Nishan', address: 'Itahari', age: '20',)
        ],
      ),
    );
  }
}
