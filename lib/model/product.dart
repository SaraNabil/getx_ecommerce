class Product {
  int id;
  String productName;
  String productPrice;
  String productImage;
  String productBrand;
  String productDescription;

  Product({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productBrand,
    required this.productDescription,
  });
}

List<Product> products = [
  Product(
      id: 1,
      productName: 'BeoPlay Speaker',
      productPrice: '\$755',
      productImage: '',
      productBrand: 'Bang and Olufsen',
      productDescription: ''),
  Product(
      id: 2,
      productName: 'Leather Wristwatch',
      productPrice: '\$450',
      productImage: '',
      productBrand: 'Tag Heuer',
      productDescription: ''),
  Product(
      id: 2,
      productName: 'Nike Dri-FIT Long Sleeve',
      productPrice: '\$1500',
      productImage: '',
      productBrand: 'Nike',
      productDescription:
          'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder.'),
];
