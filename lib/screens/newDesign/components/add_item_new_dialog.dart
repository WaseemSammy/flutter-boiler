import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/utils/utils_helper.dart';

import '../../../../../widgets/big_text.dart';
import '../../../../../widgets/big_text_for_heading.dart';

class AddItemNewDialog extends StatefulWidget {
  final Orders? menu;
  final  Function selectedMenu;
  const AddItemNewDialog(this.menu,this.selectedMenu, {super.key});

  @override
  State<AddItemNewDialog> createState() => _AddItemNewDialogPopupState();
}

class _AddItemNewDialogPopupState extends State<AddItemNewDialog> {
  int quantity = 3;
  int pepsiQuantity = 3;
  int? selectedQtygroup = 2;

  double getTotal(){
    return (quantity?? 1) * (widget.menu?.itemPrice??0);
  }
  int count = 1;
  int type = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400, // Set maximum width
          minHeight: 300, // Set minimum height
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/biryani_image.webp', // Replace with actual image URL
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "${widget.menu?.itemName}"),
                        Text('⭐ 4.5'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "\$ ${widget.menu?.itemPrice}",
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "\$ ${widget.menu?.itemPrice}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ), // Top View
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigTextForHeading(
                      text: 'Description',
                    ),
                    const Chip(
                      label: Text('Non Veg'),
                      avatar: Icon(Icons.no_food),
                    ),
                  ],
                ),
                Text(
                  "${widget.menu?.itemDescription}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigTextForHeading(
                      text: 'Size (Required)',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (quantity > 0) quantity--;
                              });
                            },
                          ),
                        ),
                        Text('$quantity'),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: selectedQtygroup,
                          onChanged: (value) {
                            setState(() {
                              selectedQtygroup = value;
                            });
                            print(value);
                          },
                        ),
                        const Text('Quarter'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedQtygroup,
                          onChanged: (value) {
                            setState(() {
                              selectedQtygroup = value;
                            });
                            print(value);
                          },
                        ),
                        const Text('Half'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: selectedQtygroup,
                          onChanged: (value) {
                            setState(() {
                              selectedQtygroup = value;
                            });
                            print(value);
                          },
                        ),
                        const Text('Full'),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigTextForHeading(
                      text: "Total \$ ${getTotal()}",
                      size: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.selectedMenu(widget.menu, quantity, 2);
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
