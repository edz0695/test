class GoldSilverModel {
  String title, price;
  int quantity;
  GoldSilverModel({
    this.quantity = 1,
    required this.title,
    required this.price,
  });
}

class GoldTypeModel {
  final String title;
  final String image;

  GoldTypeModel({
    required this.title,
    required this.image,
  });
}

final List<GoldTypeModel> types = [
  GoldTypeModel(
    title: "BUY Gold",
    image: "assets/images/goldBars.png",
  ),
  GoldTypeModel(
    title: "BUY Silver",
    image: "assets/images/silverBar.png",
  ),
  GoldTypeModel(title: "BUY Coin", image: "assets/images/gold-coin.png"),
];

List<GoldSilverModel> goldList = [
  GoldSilverModel(title: 'DG 1 Gram Gold Mint Bar 24K (99.9%)', price: '₹236'),
  GoldSilverModel(title: 'DG 2 Gram Gold Mint Bar 24K (99.9%)', price: '₹500'),
  GoldSilverModel(
      title: 'DG 2.5 Gram Gold Mint Bar 24K (99.9%)', price: '₹700'),
  GoldSilverModel(title: 'DG 5 Gram Gold Mint Bar 24K (99.9%)', price: '₹3000'),
];

List<GoldSilverModel> silverList = [
  GoldSilverModel(title: 'DG 1 Gram Silver Mint Bar 24K (99.9%)', price: '₹26'),
  GoldSilverModel(title: 'DG 2 Gram Silver Mint Bar 24K (99.9%)', price: '₹50'),
  GoldSilverModel(
      title: 'DG 2.5 Gram Silver Mint Bar 24K (99.9%)', price: '₹70'),
  GoldSilverModel(
      title: 'DG 5 Gram Silver Mint Bar 24K (99.9%)', price: '₹100'),
];
