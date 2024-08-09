class Product {
  String name;
  String description;
  int rating;
  int price;
  String image;
  String type;

  Product({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
    required this.type,
  });
}

List<Product> products = [
  Product(
      name: "Air Jordan 1",
      image: "assets/shoe-airjordan.jpeg",
      description: "Conscious Jordan Air Jordan 1 High OG 'Satin Black Toe' sneakers Supplied by a premier sneaker marketplace dealing with unworn, already sold out, in demand rarities. Each product is rigorously inspected by experienced experts guaranteeing authenticity. The Women’s Air Jordan 1 “Satin Black Toe” is a special construction of the original colorway of the Jordan 1 with satin paneling on the heel. Following the same blueprint of the “Satin Shattered Backboard” colorway that was also a women’s exclusive, this “Satin Black Toe” edition features a black and white leather upper with red satin at the heel.",
      price: 150,
      rating: 4,
      type: "Men's shoe",
  ),
  Product(
    name: "Blackout",
    image: "assets/shoe-blackout.jpeg",
    description: "Say hello to your new favorite shoe, the Athens is the perfect shoe for all-day wear around the house or a casual day at the office. 4-way stretch air mesh upper for enhanced breathability. Goodbye sweaty feet! Adjustable lacing for the perfect fit every time for any size Responsive Cushioning soles for 'stand on your feet all-day comfort' Available in sizes 6 - 13 and EE width",
    price: 225,
    rating: 5,
    type: "Women's shoe",
  ),
  Product(
    name: "Derby Leather",
    image: "assets/shoe-boots.jpeg",
    description:
        "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    price: 120,
    rating: 3,
    type: "Men's shoe",
  ),
  Product(
    name: "Victoria Heels",
    image: "assets/shoe-heels.jpeg",
    description: "Pump Type: BasicHeel Type: Thin HeelsOrigin: CN(Origin)Upper Material: PUToe Shape: Peep ToeWith Platforms: NoHeel Height: Super High (8cm-up)Fit: Fits true to size, take your normal sizeStyle: sexyis_handmade: YesFashion Element: BucklePattern Type: SolidInsole Material: PUOccasion: WeddingLining Material: PUSeason: Spring/AutumnOutsole Material: RubberItem Type: PumpsModel Number: 126-8Closure Type: Buckle StrapGender: WOMEN",
    price: 80,
    rating: 4,
    type: "Women's shoe",
  ),
  Product(
    name: "Black UnderArmour",
    image: "assets/shoe-underarmour.jpeg",
    description: "These are running shoes anyone can wear to go faster—with Charged Cushioning® to help protect against impact, a breathable upper, and durability for miles. Lightweight, breathable mesh upper with synthetic overlays for added durability & support EVA sockliner provides soft, step-in comfort Charged Cushioning® midsole uses compression molded foam for ultimate responsiveness & durability Solid rubber outsole covers high impact zones for greater durability with less weight",
    price: 300,
    rating: 5,
    type: "Men's shoe",
  ),
  Product(
    name: "New Balance",
    image: "assets/shoe-newbalance.jpeg",
    description: "As Jamie Foy's new pro model, New Balance Numeric 306 Skate Shoes have been put through the wringer. Big Boy Foy is known for huge impacts, otherworldly board control, and high consequence rails that shouldn't be left to ordinary footwear. The 306 is up to the task, with excellent board feel that's bolstered by a comfortable fit and great cushioning. Built to handle the abuse of one of the gnarliest skaters in the history of the galaxy, they're ready for action righ",
    price: 275,
    rating: 4,
    type: "Men's shoe",
  ),
];
