import 'package:ecommerce/controller/controller.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/views/mywidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController _productController = Get.put(ProductController());
  final MyWidget _myWidget = MyWidget();

  @override
  Widget build(BuildContext context) {
    // read a width device
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Ecommerce App'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Obx(
        () => SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          controller: _productController.refreshController,
          onRefresh: _productController.onRefresh,
          onLoading: _productController.onLoading,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _productController.productList.length,
            itemBuilder: (BuildContext context, i) {
              return Align(
                child: SizedBox(
                  width: width < 450
                      ? width / 1
                      : width > 500 && width < 600
                          ? width / 1.2
                          : width / 1.5,
                  child: _productCard(
                    product: _productController.productList[i],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _productCard({
    required Product product,
  }) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _myWidget.imageTile(
            img: '${product.image}',
            price: '${product.price}',
          ),
          Expanded(
            child: Container(
              height: 150,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _myWidget.cardTile(
                    title: '${product.title}',
                    description: '${product.description}',
                  ),
                  _myWidget.iconText(
                    mainAxisAlignment: MainAxisAlignment.end,
                    icon: Icons.star,
                    value: '${product.rating.rate}',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
