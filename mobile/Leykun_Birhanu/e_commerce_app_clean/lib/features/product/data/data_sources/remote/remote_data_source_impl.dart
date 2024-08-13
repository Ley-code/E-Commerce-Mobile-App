import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exception.dart';
import '../../models/product_model.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<ProductModel> addProduct(ProductModel product) async {
    final response = await client.post(
      Uri.parse(Urls.addProduct),
      body: product.toJson(),
    );
    if (response.statusCode == 201) {
      return ProductModel.fromJson(json.decode(response.body)['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteProduct(String id) async {
    final response = await client.delete(Uri.parse(Urls.deleteProductId(id)));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    final response = await client.get(Uri.parse(Urls.getProductId(id)));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body)['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(Uri.parse(Urls.getProducts));

    List<dynamic> jsonDecoded = jsonDecode(response.body)['data'];
    final products =
        jsonDecoded.map((products) => ProductModel.fromJson(products)).toList();
    if (response.statusCode == 200) {
      return products;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    final response = await client.put(
        Uri.parse(Urls.updateProductId(product.id)),
        body: product.toJson());

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body)['data']);
    } else {
      throw ServerException();
    }
  }
}
