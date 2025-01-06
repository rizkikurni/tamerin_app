import 'package:flutter/material.dart';
import 'package:tamerin/models/database_helper.dart'; // Ganti dengan path helper database Anda
import 'package:tamerin/models/transaction.dart'; // Ganti dengan model transaksi Anda

class UpdatePage extends StatefulWidget {
  final Transaction transaction;

  UpdatePage({required this.transaction});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController _nameController;
  late TextEditingController _amountController;
  late String _selectedCategory;
  late String _selectedType;
  late DateTime _selectedDate;

  final List<String> _categories = [
    'Food',
    'Top Up',
    'Freelance',
    'Shopping',
    'Active Income',
    'Passive Income',
    'Invest',
    'Others',
  ];

  final List<String> _types = ['Income', 'Outcome'];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.transaction.name);
    _amountController =
        TextEditingController(text: widget.transaction.amount.toString());
    _selectedCategory = widget.transaction.category;
    _selectedType = widget.transaction.type;
    _selectedDate = widget.transaction.date;
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _updateTransaction() async {
    final name = _nameController.text.trim();
    final amount = int.tryParse(_amountController.text.trim()) ?? 0;

    if (name.isEmpty || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields correctly')),
      );
      return;
    }

    final updatedTransaction = Transaction(
      id: widget.transaction.id,
      name: name,
      category: _selectedCategory,
      type: _selectedType,
      amount: amount,
      date: _selectedDate,
    );

    final dbHelper = DatabaseHelper.instance;
    await dbHelper.updateTransaction(updatedTransaction);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transaction updated successfully!')),
    );

    // await Future.delayed(const Duration(seconds: 1));

    // Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Type",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedType,
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
                items: _types
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter transaction name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Amount",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter amount",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                hint: const Text("Select a category"),
                value: _selectedCategory,
              ),
              const SizedBox(height: 16),
              const Text(
                "Date",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${_selectedDate.toLocal()}".split(' ')[0],
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _updateTransaction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8E4FF4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Update Transaction",
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
      ),
    );
  }
}
