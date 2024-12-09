import 'package:crud_app_project/ui/screens/update_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.network(product.image?? '',width: 30,),
      title: Text('Product Name:${product.productName ?? ''}'),
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
              Navigator.pushNamed(context, UpdateProductScreen.name,
                  arguments: product);
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
