// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Permissions_handle(),
    );
  }
}

class Permissions_handle extends StatefulWidget {
  const Permissions_handle({super.key});

  @override
  State<Permissions_handle> createState() => _Permissions_handleState();
}

class _Permissions_handleState extends State<Permissions_handle> {

  
  @override
  void initState() {
    checkper();
    super.initState();
  }

  checkper() async
  {
    await Permission.storage.isDenied.then((value) =>  Permission.storage.request());

    await Permission.camera.isDenied.then((value) =>  Permission.camera.request());

    await Permission.contacts.isDenied.then((value) =>  Permission.contacts.request());

    await Permission.sms.isDenied.then((value) =>  Permission.sms.request());

    await Permission.location.isDenied.then((value) =>  Permission.location.request());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Permission Handler",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: const Center(child: Text("Welcome",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
    );
  }
}