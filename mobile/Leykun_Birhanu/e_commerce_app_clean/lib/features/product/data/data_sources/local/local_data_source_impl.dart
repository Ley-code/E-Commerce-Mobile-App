import '../../models/product_model.dart';
import 'local_data_source.dart';

class LocalDataSourceImpl extends ProductLocalDataSource {
  @override
  Future<bool> cacheProducts(List<ProductModel> products) {
    // TODO: implement cacheProducts
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
}
