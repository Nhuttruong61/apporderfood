import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/produCartManager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ProductCartManager>(
              builder: (context, cart, child) => ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Image.network(
                    cart.items[index].imageUrl,
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                  title: Text(cart.items[index].title),
                  subtitle: Text(
                    ' ${cart.items[index].price} đồng',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cart.removeFromCart(cart.items[index]);
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tổng tiền:  ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Thanh Toán:  ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
