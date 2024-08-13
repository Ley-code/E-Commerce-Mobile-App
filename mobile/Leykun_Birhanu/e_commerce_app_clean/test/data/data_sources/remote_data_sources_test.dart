import 'package:application1/core/constants/constants.dart';
import 'package:application1/features/product/data/data_sources/remote/remote_data_source_impl.dart';
import 'package:application1/features/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../helper/dummy_data/json_reader.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteDataSourceImpl remoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSourceImpl = RemoteDataSourceImpl(client: mockHttpClient);
  });

  const tProductModel =
    ProductModel(
      id: '6672776eb905525c145fe0bb',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
    );
  List<ProductModel> tProductList = [
    const ProductModel(
      id: '6672752cbd218790438efdb0',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
    ),
    const ProductModel(
      id: '667275bab905525c145fe08f',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777275/images/t7j2mqmcukrogvvausqj.jpg',
    ),
    const ProductModel(
      id: '667275d7b905525c145fe093',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777304/images/lmngzkii9zfo17ohxa6n.jpg',
    ),
    const ProductModel(
      id: '667275f2b905525c145fe097',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777331/images/zxot6xd9x4camise1fbd.jpg',
    ),
    const ProductModel(
      id: '66727627b905525c145fe09b',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777384/images/uyk7hocbyp2kishnha6e.jpg',
    ),
    const ProductModel(
      id: '66727631b905525c145fe09f',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777394/images/npbstxdi9y564690obmr.jpg',
    ),
    const ProductModel(
      id: '66727659b905525c145fe0a3',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777434/images/lkv1xs7ge0o2ycium9zv.jpg',
    ),
    const ProductModel(
      id: '66727659b905525c145fe0a6',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777434/images/zfhdmdrucpyhtbvp1ra6.jpg',
    ),
    const ProductModel(
      id: '66727676b905525c145fe0ab',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777462/images/ckwf4ktrjsfqnrjo5tz9.jpg',
    ),
    const ProductModel(
      id: '667276abb905525c145fe0af',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777516/images/rfaqhztjhi7afybrx2cf.jpg',
    ),
    const ProductModel(
      id: '667276c6b905525c145fe0b3',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777543/images/dyn2sjdocdvqrfrauyxr.jpg',
    ),
    const ProductModel(
      id: '6672776eb905525c145fe0bb',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
    ),
    const ProductModel(
      id: '66728788b116d7a8d476558c',
      name: 'Better name',
      description: 'Even better description. The best description ever.',
      price: 112,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718781833/images/jxt6xd4ivavvuodt9gkx.jpg',
    ),
  ];

  group('get a product', () {
    String id =  '6672776eb905525c145fe0bb';
    test('should return a product model if the response is 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.getProductId(id)))).thenAnswer(
          (_) async => http.Response(
              readJson('/helper/dummy_data/dummy_product_GET_response.json'),
              200));
      //act
      final result = await remoteDataSourceImpl.getProduct(id);
      print(result);
      //assert

      expect(result, tProductModel);
    });

    test('Should throw a server exception if the response is 404', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.getProductId(id))))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      //act and assert

      expect(() async {
        await remoteDataSourceImpl.getProduct(id);
      }, throwsA(isA<Exception>()));
    });
  });

  group('get All products', () {
    test('should return a List of products  if the response is 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.getProducts))).thenAnswer(
          (_) async => http.Response(
              readJson('/helper/dummy_data/dummy_products_GET_response.json'),
              200));
      //act
      final result = await remoteDataSourceImpl.getProducts();
      //assert

      expect(result, tProductList);
    });

    test('Should throw a server exception if the response is 404', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.getProducts)))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      //act and assert

      expect(() async {
        await remoteDataSourceImpl.getProducts();
      }, throwsA(isA<Exception>()));
    });
  });

  group('add a product', () {
    test('should return the product if the response is 200', () async {
      //arrange
      when(mockHttpClient.post(Uri.parse(Urls.addProduct),
              body: tProductModel.toJson()))
          .thenAnswer(
              (_) async => http.Response(readJson('/helper/dummy_data/dummy_product_POST_response.json'), 201));
      //act
      final result = await remoteDataSourceImpl.addProduct(tProductModel);
      //assert
      expect(result, tProductModel);
    });

    test('Should throw a server exception if the response is 404', () async {
      //arrange
      when(mockHttpClient.post(Uri.parse(Urls.addProduct),
              body: tProductModel.toJson()))
          .thenAnswer((_) async => http.Response('Operation Failed', 404));
      //act
      //assert
      expect(() async {
        await remoteDataSourceImpl.addProduct(tProductModel);
      }, throwsA(isA<Exception>()));
    });
  });

  group('delete a product', () {
    const id = '3';
    test('should return true if the response is 200', () async {
      //arrange
      when(mockHttpClient.delete(Uri.parse(Urls.deleteProductId(id))))
          .thenAnswer((_) async =>
              http.Response(readJson('/helper/dummy_data/dummy_product_GET_response.json'), 200));
      //act
      final result = await remoteDataSourceImpl.deleteProduct(id);
      //assert
      expect(result, true);
    });

    test('Should throw a server exception if the response is 404', () async {
      //arrange
      when(mockHttpClient.delete(Uri.parse(Urls.deleteProductId(id))))
          .thenAnswer((_) async => http.Response('Operation Failed', 404));
      //act
      //assert
      expect(() async {
        await remoteDataSourceImpl.deleteProduct(id);
      }, throwsA(isA<Exception>()));
    });
  });

  group('update a product', () {
    const id = '6672776eb905525c145fe0bb';
    test('should return the updated product if the response is 200', () async {
      //arrange
      when(mockHttpClient.put(Uri.parse(Urls.updateProductId(id)),
              body: tProductModel.toJson()))
          .thenAnswer((_) async =>
              http.Response(readJson('/helper/dummy_data/dummy_product_PUT_response.json'), 200));
      //act
      final result = await remoteDataSourceImpl.updateProduct(tProductModel);
      //assert
      expect(result, tProductModel);
    });

    test('Should throw a server exception if the response is 404', () async {
      //arrange
      when(mockHttpClient.put(Uri.parse(Urls.deleteProductId(id)),
              body: tProductModel.toJson()))
          .thenAnswer((_) async => http.Response('Operation Failed', 404));
      //act
      //assert
      expect(() async {
        await remoteDataSourceImpl.updateProduct(tProductModel);
      }, throwsA(isA<Exception>()));
    });
  });
}
