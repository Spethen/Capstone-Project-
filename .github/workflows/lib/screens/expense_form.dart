// ignore_for_file: missing_return

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class expenseForm extends StatefulWidget {
  const expenseForm({Key key}) : super(key: key);

  @override
  State<expenseForm> createState() => expenseFormState();
}

class expenseFormState extends State<expenseForm> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final controller1 = TextEditingController();
  final controller3 = TextEditingController();
  final controller2 = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  String category = 'Finance Department';
  String Purr = 'Cash';
  String Merr = 'Amazon';
  UploadTask task;
  File file;
  String urlDownload = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Forms'),
      ),
      backgroundColor: Color.fromARGB(255, 148, 2, 2),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                    isDense: true,
                  ),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Unfilled field';
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Purchased Item',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                    isDense: true,
                  ),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Unfilled field';
                    }
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller2,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Amount Paid',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(205, 11, 226, 3),
                    ),
                    isDense: true,
                  ),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Unfilled field';
                    }
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller3,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Tax Paid',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(205, 11, 226, 3),
                    ),
                    isDense: true,
                  ),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Unfilled field';
                    }
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: dateCtl,
                  decoration: InputDecoration(
                    labelText: "Purchase Date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                    isDense: true,
                  ),
                  onTap: () async {
                    DateTime date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date = await showDatePicker(
                        initialDatePickerMode: DatePickerMode.day,
                        helpText: ' ',
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    dateCtl.text = date.toString();
                  },
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: category,
                  elevation: 16,
                  icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                  style: const TextStyle(
                      //te
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 1, 39, 255), //Font color
                      fontSize: 20 //font size on dropdown button
                      ),

                  dropdownColor: Color.fromARGB(255, 106, 7,
                      7), //dropdown background color //dropdown background color
                  isExpanded: true, //make true to make width 100%
                  isDense: true,
                  decoration: InputDecoration(
                    labelText: 'Department Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Unfilled Category';
                    }
                  },
                  onChanged: (String newValue) {
                    if (newValue != null) {
                      setState(() {
                        category = newValue;
                      });
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Sales Department',
                      child: Text('Sales Department'),
                    ),
                    DropdownMenuItem(
                      value: 'Accounts and Finance Department',
                      child: Text('Accounts and Finance Department'),
                    ),
                    DropdownMenuItem(
                      value: 'HR and Corporate Personelle',
                      child: Text('HR and Corporate Personelle'),
                    ),
                    DropdownMenuItem(
                      value: 'Finance Department',
                      child: Text('Finance Department'),
                    ),
                    DropdownMenuItem(
                      value: 'Material Management and Warehouse',
                      child: Text('Material Management and Warehouse'),
                    ),
                    DropdownMenuItem(
                      value: 'Administrative Department',
                      child: Text('Administrative Department'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: Merr,
                  elevation: 16,
                  icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                  style: const TextStyle(
                      //te
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 1, 48, 255), //Font color
                      fontSize: 20 //font size on dropdown button
                      ),

                  dropdownColor: Color.fromARGB(
                      255, 106, 7, 7), //dropdown background color
                  isExpanded: true, //make true to make width 100%
                  isDense: true,
                  decoration: InputDecoration(
                    labelText: 'Merchant Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Unfilled Category';
                    }
                  },
                  onChanged: (String newValue) {
                    if (newValue != null) {
                      setState(() {
                        Merr = newValue;
                      });
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Walmart',
                      child: Text('Walmart'),
                    ),
                    DropdownMenuItem(
                      value: 'Staples',
                      child: Text('Staples'),
                    ),
                    DropdownMenuItem(
                      value: 'Target',
                      child: Text('Target'),
                    ),
                    DropdownMenuItem(
                      value: 'Best Buy',
                      child: Text('Best Buy'),
                    ),
                    DropdownMenuItem(
                      value: 'Microsoft',
                      child: Text('Microsoft'),
                    ),
                    DropdownMenuItem(
                      value: 'Amazon',
                      child: Text('Amazon'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: Purr,
                  elevation: 16,
                  icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                  style: const TextStyle(
                      //te
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 1, 43, 255), //Font color
                      fontSize: 20 //font size on dropdown button
                      ),

                  dropdownColor: Color.fromARGB(
                      255, 106, 7, 7), //dropdown background color
                  isExpanded: true, //make true to make width 100%
                  isDense: true,
                  decoration: InputDecoration(
                    labelText: 'Purchase Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Unfilled Category';
                    }
                  },
                  onChanged: (String newValue) {
                    if (newValue != null) {
                      setState(() {
                        Purr = newValue;
                      });
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Credit Card',
                      child: Text('Credit Card'),
                    ),
                    DropdownMenuItem(
                      value: 'Online Transaction',
                      child: Text('Online Transaction'),
                    ),
                    DropdownMenuItem(
                      value: 'Cash',
                      child: Text('Cash'),
                    ),
                  ],
                ),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    var formValid = formKey.currentState.validate() ?? false;
                    var message = 'Form isn\'t valid';
                    if (formValid) {
                      message =
                          'Form is valid, Records Entered in DB: ${controller.text}';
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_enhance_sharp),
        backgroundColor: Color.fromARGB(255, 0, 18, 173),
        label: const Text('BILL'),
        onPressed: () {
          selectfile();
        },
      ),
    );
  }

  Future uploaddata(String Xave) async {
    final Collect = FirebaseFirestore.instance.collection('Expenses').doc();

    final json = {
      'Fullname': controller.text,
      'Item Description': controller1.text,
      'Amount Paid': controller2.text,
      'TaxPaid': controller3.text,
      'Purchase Date': dateCtl.text,
      'Department Name': category,
      'Merchant Name': Merr,
      'Purchase Type': Purr,
      'Image URL': Xave,
    };

    await Collect.set(json);
  }

  Future selectfile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;
    final path = result.files.single.path;
    setState(() => file = File(path));
    final destination = 'Expense/ ' + controller.text;

    task = FirebaseApi.uploadfile(destination, file);

    final snapshot = await task.whenComplete(() {});
    String urlDownload = await snapshot.ref.getDownloadURL();
    uploaddata(urlDownload);
  }
}

class FirebaseApi {
  static UploadTask uploadfile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
