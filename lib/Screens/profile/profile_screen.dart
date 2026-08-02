import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../auth/login_screen.dart';
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final User? user = FirebaseAuth.instance.currentUser;
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,

        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text("Profile"),
        ),

        body: FutureBuilder<DocumentSnapshot>(
    future: FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get(),

    builder: (context, snapshot) {

    if (snapshot.connectionState ==
    ConnectionState.waiting) {

    return const Center(
    child: CircularProgressIndicator(),
    );
    }


    if (!snapshot.hasData) {
    return const Center(
    child: Text("No Data"),
    );
    }


    final data =
    snapshot.data!.data()
    as Map<String, dynamic>;


    return Padding(
    padding: const EdgeInsets.all(20),

    child: Column(

    children: [

    const CircleAvatar(
    radius: 45,
    child: Icon(
    Icons.person,
    size: 50,
    ),
    ),

    const SizedBox(height: 30),


    Text(
    data["name"] ?? "",
    style: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    ),
    ),


    const SizedBox(height: 15),


    Text(
    data["email"] ?? "",
    style: const TextStyle(
    fontSize: 16,
    ),
    ),


    const SizedBox(height: 10),


    Text(
    data["phone"] ?? "",
    style: const TextStyle(
    fontSize: 16,
    ),
    ),


    const Spacer(),


    SizedBox(
    width: double.infinity,

    child: ElevatedButton(
    onPressed: () => logout(context),

    style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    ),

    child: const Text(
    "Logout",
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    ),
    ),

    ],
    ),
    );
    },
    ),
    );
  }
}