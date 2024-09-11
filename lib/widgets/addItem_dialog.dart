import 'package:flutter/material.dart';
import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/widgets/big_text.dart';
import 'package:my_flutter/widgets/big_text_for_heading.dart';

class AdditemDialog extends StatefulWidget {
  final Function selectedMenu;
  final Orders order;


   const AdditemDialog( this.selectedMenu,this.order,{super.key});

  @override
  State<AdditemDialog> createState() => _AdditemDialogState();
}

class _AdditemDialogState extends State<AdditemDialog> {
  int quantity = 3;
  int pepsiQuantity = 3;
  int? selectedQtygroup = 2;

  double getTotal(){
    return (quantity?? 1) * (widget.order.itemPrice??0);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width * 1.5,
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
                   const SizedBox(width: 20,),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text:
                        'Spicy Ramen',
                      ),
                      const Text('⭐ 4.5'),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "\$ ${widget.order.itemPrice}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            "\$ ${widget.order.itemPrice}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )

                ],
              ), // Top View
              const SizedBox(height: 10),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextForHeading(
                    text:
                    'Description',

                  ),
                  const Row(
                    children: [
                      Chip(
                        label: Text('Non Veg'),
                        avatar: Icon(Icons.no_food),
                      ),
                    ],
                  ),
                ],
              ),
                Text(
                "${widget.order.itemDescription}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   BigTextForHeading(
                    text:
                    'Size (Required)',
                               ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Card(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(100),
                         ),
                         child: IconButton(
                           icon: const Icon(Icons.remove),
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
                           icon: const Icon(Icons.add),
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
                  )

                ],
              ),
            const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   BigTextForHeading( text:
                    "Total \$ ${getTotal()}",
                    size: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.selectedMenu(widget.order, quantity, 2);
                    },
                    child: const Text('Add'),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}


