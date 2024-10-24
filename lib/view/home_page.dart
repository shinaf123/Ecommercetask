import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mechinetask/view/product_detail.dart';
import '../controller/product_controller.dart';

class HomePage extends StatelessWidget {
  // final ProductController productController = Get.put(ProductController());
  final HomeController productController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey[500],
        appBar: AppBar(
          title: Text('E-Commerce App'),
        ),
        body: GetBuilder<HomeController>(builder: (productController) {
          if (productController.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (productController.productsss.isEmpty) {
            return Center(child: Text('No Products Available'));
          } else {
            return GridView.builder(
                itemCount: productController.productsss.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 200),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProductDetailPage(product: productController.productsss[index],);
                    })),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(02, 2.3),
                                    color: Colors.grey,
                                    blurRadius: 1.3,
                                    spreadRadius: 2.4)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  child: Image.asset( "assets/attractive-young-woman-portrait-indoor 1.png",
                                fit: BoxFit.cover,)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    productController.productsss[index].brand,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productController
                                            .productsss[index].name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                          productController
                                              .productsss[index].price
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          )),
                                      Text(
                                          productController
                                              .productsss[index].rating
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  );
                });
          }
        }));
  }
}
