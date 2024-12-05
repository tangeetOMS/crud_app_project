import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static const name = 'Update_product';
  @override
  State<UpdateProductScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<UpdateProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: buildProductForm(),
        ),
      ),
    );
  }

  Widget buildProductForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _nameTEController,
            decoration: InputDecoration(
              hintText: 'Name',
              labelText: 'Product Name',
              border: OutlineInputBorder(),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _priceTEController,
            decoration: InputDecoration(
              hintText: 'Price',
              labelText: 'Product Price',
              border: OutlineInputBorder(),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product price';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _totalPriceTEController,
            decoration: InputDecoration(
              hintText: 'Total Price',
              labelText: 'Product Total Price',
              border: OutlineInputBorder(),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product total price';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _quantityTEController,
            decoration: InputDecoration(
              hintText: 'Quantity',
              labelText: 'Product Quantity',
              border: OutlineInputBorder(),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product quantity';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _codeTEController,
            decoration: InputDecoration(
              hintText: 'Code',
              labelText: 'Product Code',
              border: OutlineInputBorder(),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product code';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _imageTEController,
            decoration: InputDecoration(
              hintText: 'Image Url',
              labelText: 'Product Image',
              border: OutlineInputBorder(),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter product image';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 35,
          ),
          ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()){

                }
              },
              child: Text('Update'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 170,vertical: 5),
                  backgroundColor: Colors.redAccent
              )
          ),
        ],
      ),
    );
  }
  void dispose(){
    _nameTEController.dispose();
    _priceTEController.dispose();
    _totalPriceTEController.dispose();
    _quantityTEController.dispose();
    _codeTEController.dispose();
    _imageTEController.dispose();
    super.dispose();
  }
}

