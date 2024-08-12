import '../../models/product_model.dart';
import 'local_data_source.dart';

class LocalDataSourceImpl extends LocalDataSource{
  @override
  Future<void> addProduct(ProductModel product) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<void> cacheProduct(List<ProductModel> products) {
    // TODO: implement cacheProduct
    throw UnimplementedError();
  }

  @override
  Future<void> cacheProducts(ProductModel product) {
    // TODO: implement cacheProducts
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getProduct(String id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

}