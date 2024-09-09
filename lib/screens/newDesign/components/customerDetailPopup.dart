import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerDetailsDialog extends StatelessWidget {
  final String tableNumber;
  final VoidCallback onPressed;

  const CustomerDetailsDialog({required this.tableNumber,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,  // Set maximum width
          minHeight: 300, // Set minimum height
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.person,
                size: 50,
                color: Colors.greenAccent,
              ),
              const SizedBox(height: 10),
              Text(
                'Customer Details of $tableNumber',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Full name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  onPressed;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
