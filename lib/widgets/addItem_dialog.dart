import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/widgets/big_text.dart';
import 'package:my_flutter/widgets/big_text_for_heading.dart';

class AdditemDialog extends StatefulWidget {
  const AdditemDialog({super.key});

  @override
  State<AdditemDialog> createState() => _AdditemDialogState();
}

class _AdditemDialogState extends State<AdditemDialog> {
  int quantity = 3;
  int pepsiQuantity = 3;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(

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
                   SizedBox(width: 20,),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text:
                        'Spicy Ramen',
                      ),
                      Text('⭐ 4.5'),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '\$200',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            '\$150',
                            style: TextStyle(
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
               const Text(
                'Ramen noodles, half boiled egg, deep fried onion rings, salted beet root slices, spinach, special curry, naga spice.',
                style: TextStyle(fontSize: 16),
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
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      const Text('Quarter'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      const Text('Half'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: 1,
                        onChanged: (value) {},
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
                    'Total \$3489.87',
                    size: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Update Cart'),
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


