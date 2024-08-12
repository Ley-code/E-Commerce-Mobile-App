
import 'package:application1/core/error/exception.dart';
import 'package:application1/core/error/failure.dart';
import 'package:application1/features/product/data/models/product_model.dart';
import 'package:application1/features/product/data/repositories/product_repository_impl.dart';
import 'package:application1/features/product/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late ProductRepositoryImpl productRepositoryImpl;

  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    productRepositoryImpl =
        ProductRepositoryImpl(remoteDataSource: mockProductRemoteDataSource);
  });

  const tProductModel = ProductModel(
    id: '3',
    name: 'airjordan',
    description: 'something you wear',
    price: 566,
    imageUrl: 'https://www.google.com',
    category: 'men\'s shoes',
    rating: 3,
  );
  const tProductEntity = ProductEntity(
    id: '3',
    name: 'airjordan',
    description: 'something you wear',
    price: 566,
    imageUrl: 'https://www.google.com',
    category: 'men\'s shoes',
    rating: 3,
  );

  String id = '3';
  group('add Product', () {
    test(
        'should return a product entity when the call to remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.addProduct(tProductModel))
          .thenAnswer((_) async => tProductModel);
      //act
      final result = await productRepositoryImpl.addProduct(tProductEntity);
      //assert
      expect(result, const Right(tProductEntity));
    });
    test(
      'should return a server failure when a call to remote data source is unsuccessful',
      () async {
        //arrange
        when(mockProductRemoteDataSource.addProduct(tProductModel))
            .thenThrow(ServerException());
        //act
        final result = await productRepositoryImpl.addProduct(tProductEntity);
        //assert
        expect(result, const Left(ServerFailure('An error has occurred')));
      },
    );
    test(
      'should return a connection failure when a device has no internet',
      () async {
        //arrange
        when(mockProductRemoteDataSource.addProduct(tProductModel))
            .thenThrow(SocketException());
        //act
        final result = await productRepositoryImpl.addProduct(tProductEntity);
        //assert
        expect(result,
            equals(const Left(ConnectionFailure('No internet connection'))));
      },
    );
  });

  group('get a product', () {
    test(
        'should return a product when a call to remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getProduct(id))
          .thenAnswer((_) async => tProductModel);
      //act
      final result = await productRepositoryImpl.getProduct(id);
      //assert
      expect(result, const Right(tProductEntity));
    });

    test(
        'should return a server failure when a call to remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getProduct(id))
          .thenThrow(ServerException());
      //act
      final result = await productRepositoryImpl.getProduct(id);
      //assert
      expect(result, const Left(ServerFailure('An error has occurred')));
    });

    test(
        'should return a Connection Failure when the device is not connected to the internet',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getProduct(id))
          .thenThrow(SocketException());
      //act
      final result = await productRepositoryImpl.getProduct(id);
      //assert
      expect(result, const Left(ConnectionFailure('No internet connection')));
    });
  });

   group('get products', () {
    test(
        'should return a list of products when a call to remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getProducts())
          .thenAnswer((_) async => [tProductModel]);
      //act
      final result = await productRepositoryImpl.getProducts();
      final unpackedResult =
            result.fold((failure) => null, (productList) => productList);
      //assert
      expect(unpackedResult,  [tProductEntity]);
    });

    test(
        'should return a server failure when a call to remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getProducts())
          .thenThrow(ServerException());
      //act
      final result = await productRepositoryImpl.getProducts();
      //assert
      expect(result, const Left(ServerFailure('An error has occurred')));
    });

    test(
        'should return a Connection Failure when the device is not connected to the internet',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getProducts())
          .thenThrow(SocketException());
      //act
      final result = await productRepositoryImpl.getProducts();
      //assert
      expect(result, const Left(ConnectionFailure('No internet connection')));
    });

    
  });

   group('Update a product', () {
    test(
        'should return a a product when a call to remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.updateProduct(tProductModel))
          .thenAnswer((_) async => (tProductModel));
      //act
      final result = await productRepositoryImpl.updateProduct(tProductEntity);
      //assert
      expect(result,  const Right(tProductEntity));
    });

    test(
        'should return a server failure when a call to remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.updateProduct(tProductModel))
          .thenThrow(ServerException());
      //act
      final result = await productRepositoryImpl.updateProduct(tProductEntity);
      //assert
      expect(result, const Left(ServerFailure('An error has occurred')));
    });

    test(
        'should return a Connection Failure when the device is not connected to the internet',
        () async {
      //arrange
      when(mockProductRemoteDataSource.updateProduct(tProductModel))
          .thenThrow(SocketException());
      //act
      final result = await productRepositoryImpl.updateProduct(tProductEntity);
      //assert
      expect(result, const Left(ConnectionFailure('No internet connection')));
    });
  });
  group('delete a product', () {
    test(
        'should return a boolean value when a call to remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.deleteProduct(id))
          .thenAnswer((_) async => (true));
      //act
      final result = await productRepositoryImpl.deleteProduct(id);
      //assert
      expect(result, const Right(true));
    });

    test(
        'should return a server failure when a call to remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.deleteProduct(id))
          .thenThrow(ServerException());
      //act
      final result = await productRepositoryImpl.deleteProduct(id);
      //assert
      expect(result, const Left(ServerFailure('An error has occurred')));
    });

    test(
        'should return a Connection Failure when the device is not connected to the internet',
        () async {
      //arrange
      when(mockProductRemoteDataSource.deleteProduct(id))
          .thenThrow(SocketException());
      //act
      final result = await productRepositoryImpl.deleteProduct(id);
      //assert
      expect(result, const Left(ConnectionFailure('No internet connection')));
    });
  });  
}
