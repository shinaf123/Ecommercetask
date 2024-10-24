import 'package:flutter/material.dart';
import 'package:new_mechinetask/model/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(product.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/attractive-young-woman-portrait-indoor 1.png"),fit: BoxFit.fill)
              ),
            ),
            // Image.network(product.imageUrl),
            SizedBox(height: 16),
            Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('\$${product.price}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Brand: ${product.brand}'),
            SizedBox(height: 8),
            Text('Rating: ${product.rating}'),
            SizedBox(height: 8),
            Text('Discounted Price: \$${product.discountedPrice}'),
          ],
        ),
      ),
    );
  }
}
