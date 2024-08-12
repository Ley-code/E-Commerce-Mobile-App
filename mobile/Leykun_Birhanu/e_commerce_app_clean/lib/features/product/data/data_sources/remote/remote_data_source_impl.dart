import '../../models/product_model.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl implements ProductRemoteDataSource{
  @override
  Future<ProductModel> addProduct(ProductModel product) {
    // TODO: implement addProduct
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