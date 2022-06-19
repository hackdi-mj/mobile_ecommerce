import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/model/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test 1', () {
    // The model should be able to receive the following data:
    final product = Product(
      id: 1,
      title: '',
      category: '',
      description: '',
      image: '',
      price: 1.0,
      rating: Rating(
        rate: 1.0,
        count: 1,
      ),
    );

    expect(product.id, 1);
    expect(product.title, '');
    expect(product.category, '');
    expect(product.description, '');
    expect(product.image, '');
    expect(product.price, 1.0);
    expect(product.rating.rate, 1.0);
    expect(product.rating.count, 1);
  });

  test('test 2', () {
    final file = File('test/test_product/product.json').readAsStringSync();
    final product = Product.fromJson(jsonDecode(file) as Map<String, dynamic>);

    expect(product.id, 1);
    expect(
        product.title, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops');
    expect(product.category, "men's clothing");
    expect(product.description,
        'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday');
    expect(product.image,
        'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg');
    expect(product.price, 109.95);
    expect(product.rating.rate, 3.9);
    expect(product.rating.count, 120);
  });
}
