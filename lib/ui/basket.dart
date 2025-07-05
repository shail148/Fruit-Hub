import 'package:flutter/material.dart';
import 'package:fruit_hub/data/cart_data.dart';

class MyBasketScreen extends StatelessWidget {
  const MyBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFA75D),
      body: Column(
        children: [
          // Top Bar
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.deepPurple,
                  ),
                  label: const Text(
                    'Go back',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 12),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: const StadiumBorder(),
                  ),
                ),
                const Spacer(),
                const Text(
                  'My Basket',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),

          const SizedBox(height: 70),

          // Basket Items
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        final oneitemprice = int.parse(
                          item['price'].replaceAll(RegExp(r'[^\d]'), ''),
                        );
                        final int quantity = item['quantity'] as int;
                        final totalprice = oneitemprice * quantity;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item['image'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2A254D),
                                      ),
                                    ),
                                    Text(
                                      '${item['quantity']} packs',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '₦ $totalprice',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2A254D),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  const Divider(height: 20),

                  // Total + Checkout
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            '₦ ${calculateTotal()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFF2A254D),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: false,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(
                                    context,
                                  ).viewInsets.bottom,
                                ),
                                child: SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(30),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.close),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'Delivery address',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Color(0xFF2A254D),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        TextField(
                                          decoration: InputDecoration(
                                            hintText: 'Noida Sector 62',
                                            filled: true,
                                            fillColor: Color(0xFFF3F3F3),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 30),
                                        const Text(
                                          'Number we can call',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Color(0xFF2A254D),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        TextField(
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            hintText: '09090605708',
                                            filled: true,
                                            fillColor: Color(0xFFF3F3F3),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 30),

                                        // Payment Buttons
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () {
                                                cart.clear();
                                                Navigator.pushNamed(context,'/order_complete');
                                              },
                                              style: OutlinedButton.styleFrom(
                                                side: const BorderSide(
                                                  color: Colors.orange,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 14,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: const Text(
                                                'Pay on delivery',
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                ),
                                              ),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                  backgroundColor: Colors.white,
                                                  context: context,
                                                  builder: (context) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets.only( top: 10,left: 10,right: 10

                                                            ),
                                                            // height: MediaQuery.of(
                                                            //   context,
                                                            // ).size.height,
                                                            width: double.infinity,
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    30,
                                                                  ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize.min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    IconButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(
                                                                          context,
                                                                        );
                                                                      },
                                                                      icon: Icon(
                                                                        Icons.close,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text("Card Holders Name",style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.bold),),
                                                                SizedBox(height: 10,),
                                                                TextField(
                                                                  keyboardType: TextInputType.text,
                                                                  decoration: InputDecoration(
                                                                    hintText: "Enter Name",
                                                                    filled: true,
                                                                    fillColor: Color(0xFFF3F3F3),
                                                                    border: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(10),
                                                                      borderSide: BorderSide.none
                                                                    )
                                                                  ),
                                                                ),
                                                                Text("Card Number",style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.bold),),
                                                                SizedBox(height: 10,),
                                                                TextField(
                                                                    keyboardType: TextInputType.number,
                                                                  decoration: InputDecoration(
                                                                      hintText: "1234 5678 9012 1314",
                                                                      filled: true,
                                                                      fillColor: Color(0xFFF3F3F3),
                                                                      border: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                          borderSide: BorderSide.none
                                                                      )
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                   Expanded(child: Column(
                                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                                     children: [
                                                                       Text("Date",style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.bold),),
                                                                       SizedBox(height: 10,),
                                                                       TextField(
                                                                         keyboardType: TextInputType.number,
                                                                         decoration: InputDecoration(
                                                                             hintText: "12/30",
                                                                             filled: true,
                                                                             fillColor: Color(0xFFF3F3F3),
                                                                             border: OutlineInputBorder(
                                                                                 borderRadius: BorderRadius.circular(10),
                                                                                 borderSide: BorderSide.none
                                                                             )
                                                                         ),
                                                                       ),
                                                                     ],
                                                                   )),
                                                                    SizedBox(width: 16,),
                                                                    Expanded(child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text("CVV",style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.bold),),
                                                                        SizedBox(height: 10,),
                                                                        TextField(
                                                                          keyboardType: TextInputType.number,
                                                                          decoration: InputDecoration(
                                                                              hintText: "123",
                                                                              filled: true,
                                                                              fillColor: Color(0xFFF3F3F3),
                                                                              border: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  borderSide: BorderSide.none
                                                                              )
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ))
                                                                  ],
                                                                ),
                                                               SizedBox(height: 20,),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: double.infinity,
                                                            padding: const EdgeInsets.symmetric(vertical: 16),
                                                            decoration: BoxDecoration(
                                                              color: const Color(0xFFFFA75D),
                                                              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                                                            ),
                                                            child: Center(
                                                              child: Container(
                                                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                                                decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(10),
                                                                ),
                                                                child: TextButton(onPressed: (){
                                                                  cart.clear();
                                                                  Navigator.pushNamed(context, '/order_complete');
                                                                }, child: const Text(
                                                                  "Complete Order",
                                                                  style: TextStyle(
                                                                    color: Color(0xFFFFA75D),
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                ),)
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              style: OutlinedButton.styleFrom(
                                                side: const BorderSide(
                                                  color: Colors.orange,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 14,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: const Text(
                                                'Pay with card',
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 20,
                          ),
                          backgroundColor: const Color(0xFFFFA75D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  // Total Price Calculation
  int calculateTotal() {
    int allprice = 0;
    for (var item in cart) {
      final int price = int.parse(
        item['price'].replaceAll(RegExp(r'[^\d]'), ''),
      );
      final int quantity = item['quantity'] as int;
      allprice += price * quantity;
    }
    return allprice;
  }
}
