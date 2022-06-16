import 'package:ecommerce/controller/controller.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    // for read a size of width devices
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Ecommerce App'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Obx(
          () => ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: _productController.productList.length,
            itemBuilder: (BuildContext context, i) {
              return Align(
                child: SizedBox(
                  width: width <= 400 ? width / 1 : width / 1.8,
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
          _imageTile(
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
                  _cardTile(
                    title: '${product.title}',
                    description: '${product.description}',
                  ),
                  _iconText(
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

  Widget _imageTile({
    required String img,
    required String price,
  }) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: _iconText(
              mainAxisAlignment: MainAxisAlignment.start,
              icon: Icons.attach_money,
              value: price,
            ),
          ),
          Container(
            height: 120,
            width: 120,
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Image.network(
              img,
            ),
          )
        ],
      ),
    );
  }

  Widget _cardTile({
    required String title,
    required String description,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              description,
              maxLines: 4,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconText({
    required IconData icon,
    required String value,
    required MainAxisAlignment mainAxisAlignment,
  }) {
    return Container(
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Container(
            height: 15,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Icon(
                icon,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 2,
            ),
            height: 15,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
