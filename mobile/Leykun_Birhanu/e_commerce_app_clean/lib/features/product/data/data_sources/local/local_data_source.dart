import '../../models/product_model.dart';

abstract class LocalDataSource {
  Future<ProductModel> getProduct(String id);
  Future<void> cacheProducts(ProductModel product);
  Future<void> cacheProduct(List<ProductModel> products);
  Future<List<ProductModel>> getProducts();
  Future<bool> deleteProduct(String id);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> addProduct(ProductModel product);
}