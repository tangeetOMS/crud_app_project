import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key,required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
     /* leading: Image.network(
          'https://www.apple.com/newsroom/images/product/iphone/standard/Apple-iPhone-14-iPhone-14-Plus-2up-purple-220907_inline.jpg.large.jpg'),*/
      title: Text(product.productName ?? ''),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code:${product.productCode ?? ''}'),
          Text('Quantity:${product.quantity ?? ''}'),
          Text('Price: ${product.unitPrice ?? ''}'),
          Text('Total price:${product.totalPrice ?? ''}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'Update_product');
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}




