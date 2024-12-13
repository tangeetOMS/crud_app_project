import 'package:crud_app_project/ui/screens/update_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, required this.delete});
  final VoidCallback delete;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.network(product.image ?? '',width: 40,),
      leading: Image(
        height: 100,
        width: 70,
        image: NetworkImage('${product.image}'),
        errorBuilder: (context, error, stackTrace) {
          return Image.network(
              'https://static.thenounproject.com/png/1211233-200.png');
        },
      ),
      title: Text('Product Name:${product.productName ?? 'UnKnown'}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code:${product.productCode ?? 'UnKnown'}'),
          Text('Quantity:${product.quantity ?? 'UnKnown'}'),
          Text('Price: ${product.unitPrice ?? 'UnKnown'}'),
          Text('Total price:${product.totalPrice ?? 'UnKnown'}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: delete,
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
