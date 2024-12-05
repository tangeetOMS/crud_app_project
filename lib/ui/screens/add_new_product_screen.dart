import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});
  static const name = 'Add_new_product';
  @override
  State<AddNewProductScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewProductInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new product'),
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
            keyboardType: TextInputType.number,
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
            keyboardType: TextInputType.number,
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
            keyboardType: TextInputType.number,
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
          Visibility(
            visible: _addNewProductInProgress==false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addNewProduct();
                }
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 170, vertical: 5),
                  backgroundColor: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addNewProduct() async {
    _addNewProductInProgress = true;
    setState(() {});
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
    Map<String, dynamic> requestBody = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _codeTEController.text.trim(),
      "ProductName": _nameTEController.text.trim(),
      "Qty": _quantityTEController.text.trim(),
      "TotalPrice": _totalPriceTEController.text.trim(),
      "UnitPrice": _priceTEController.text.trim(),
    };
    Response response = await post(
      uri,
      headers: {'Content_type': 'application/json'},
      body: jsonEncode(requestBody),
    );
    _addNewProductInProgress=false;
    setState(() {});
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      _clearTextFields();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('New product aded!'),
        ),
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('New product add failed! Try again .'),
        ),
      );
    }
  }

  void _clearTextFields() {
    _nameTEController.clear();
    _priceTEController.clear();
    _totalPriceTEController.clear();
    _quantityTEController.clear();
    _codeTEController.clear();
    _imageTEController.clear();
  }

  void dispose() {
    _nameTEController.dispose();
    _priceTEController.dispose();
    _totalPriceTEController.dispose();
    _quantityTEController.dispose();
    _codeTEController.dispose();
    _imageTEController.dispose();
    super.dispose();
  }
}
