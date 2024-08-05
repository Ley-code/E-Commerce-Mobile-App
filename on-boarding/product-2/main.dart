import 'dart:io';

//For handling Custome exception
class IncorrectInputException implements Exception {
  final String message;
  IncorrectInputException(this.message);
  @override
  String toString() => '$message';
}


class Product {
  String _name, _description;
  int _price;

  Product(String this._name, String this._description, int this._price);

  String get name => _name;
  int get price => _price;
  String get description => _description;

  set name(String name) {
    _name = name;
  }
  set price(int price) {
    if (price < 0) {
      print("Price can not be negative!");
    } else {
      _price = price;
    }
  }
  set description(String description) {
    _description = description;
  }
}

class ProductManager {

  static List<Product> _products = [];

  static get products => _products;
  static void addProduct(Product newproduct) {
    products.add(newproduct);
  }

  static void viewProducts() {
    for (var product in products) {
      print(
          "Name: ${product.name} \nDescritpiton: ${product.description}\nPrice: ${product.price} ");
      print("");
    }
  }

  static void viewSingleProduct(String name) {
    for (Product product in products) {
      if (product.name == name) {
        print(
            "Name: ${product.name} \nDescritpiton: ${product.description}\nPrice: ${product.price} ");
        return;
      }
    }
    throw IncorrectInputException("Product not found");
  }

  static void editSingleProduct(String name, Product update) {
    for (Product product in products) {
      if (product.name == name) {
        product.name = update.name;
        product.description = update.description;
        product.price = update.price;
        return;
      }
    }
    throw IncorrectInputException("Product not found");
  }

  static void delete(String name) {
    for (Product product in products) {
      if (product.name == name) {
        products.remove(product);
        return;
      }
    }
    throw IncorrectInputException("Product not found");
  }
}

void Run() {
  print("---------Welcome To E-Commerce!!---------");
  print("");
  print("type 'h' for help");
  print("");

  //Recieving input from the user
  stdout.write("> ");
  String? input = stdin.readLineSync();
  while (input != "q") {
    try {

      List<String> words = input!.split(" ");
      
      if (words[0] == "v") {
        if (words.length == 2) {
          ProductManager.viewSingleProduct(words[1]);
        } else if (words.length == 1) {
          ProductManager.viewProducts();
        } else {
          throw IncorrectInputException(
              "Incorrect input given press 'h' for help. to see the correct commands");
        }
      }
      
      else if (words[0] == "a") {
        List<String> slicedwords = words.sublist(2, words.length - 1);
        String description = slicedwords.join(' ');
        ProductManager.addProduct(
            Product(words[1], description, int.parse(words[words.length - 1])));
      }
      
      else if (words[0] == "e") {
        List<String> slicedwords = words.sublist(4, words.length - 1);
        String description = slicedwords.join(' ');
        ProductManager.editSingleProduct(words[1],
            Product(words[3], description, int.parse(words[words.length - 1])));
      }
      
      else if (words[0] == "d") {
        ProductManager.delete(words[1]);
      }
      
      else if (words[0] == "h") {
        print(
            "Here are some helpful Commands you can use to get started: \nq ------------------------------------------------------------------ Close application \na 'productName' 'description' 'price' ------------------------------ addProduct \nv ------------------------------------------------------------------ view Products \nd 'productName' ---------------------------------------------------- Delete product \nv 'productName' ---------------------------------------------------- view a single product \ne 'productName' 'UpdatedName' 'Updateddescription' 'Updatedprice' -- editProduct ");
      }

    //Handling Custom Exception
    } on IncorrectInputException catch (e) {
      print(e);
    } catch (e) {
      print(
          "Incorrect input given press 'h' for help. to see the correct commands");
    }

    stdout.write("> ");
    input = stdin.readLineSync();
  }
}

void main(List<String> args) {
  Run();
}
