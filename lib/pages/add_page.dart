import 'package:flutter/material.dart';
import 'package:tamerin/models/database_helper.dart';
import 'package:tamerin/models/transaction.dart' as model;

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final List<String> categories = [
    'Food',
    'Top Up',
    'Freelance',
    'Shopping',
    'Active Income',
    'Passive Income',
    'Invest',
    'Others'
  ];
  final List<String> types = ['Income', 'Outcome'];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String? selectedType;
  String? selectedCategory;
  DateTime? selectedDate;

  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  void _submitTransaction() async {
    if (selectedType == null ||
        selectedCategory == null ||
        nameController.text.isEmpty ||
        amountController.text.isEmpty ||
        selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Convert amount to integer
    final int amount = int.tryParse(amountController.text) ?? 0;
    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Amount must be greater than zero')),
      );
      return;
    }

    // Create transaction object
    final transaction = model.Transaction(
      type: selectedType!,
      name: nameController.text,
      category: selectedCategory!,
      date: selectedDate!,
      amount: amount,
      balance: 0, // Saldo akan dihitung di DatabaseHelper
    );

    // Save transaction to database
    await dbHelper.createTransaction(transaction);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Transaction added successfully')),
    );

    // Clear inputs
    nameController.clear();
    amountController.clear();
    dateController.clear();
    setState(() {
      selectedType = null;
      selectedCategory = null;
      selectedDate = null;
    });
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text =
            pickedDate.toLocal().toIso8601String().split('T')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Transaction",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Type",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: types.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value;
                });
              },
              hint: const Text("Select a type"),
              value: selectedType,
            ),
            const SizedBox(height: 16),
            const Text(
              "Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter transaction name",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Amount",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter amount",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Category",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              hint: const Text("Select a category"),
              value: selectedCategory,
            ),
            const SizedBox(height: 16),
            const Text(
              "Date",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                hintText: "Select a date",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: _pickDate,
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _submitTransaction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C5DD3),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Add Transaction",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
