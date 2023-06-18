class CCData {
  String name;
  String symbol;
  int rank;
  double price;

  CCData(
      {required this.name,
      required this.rank,
      required this.symbol,
      required this.price});

  @override
  String toString() {
    return "CCData(name: $name, symbol: $symbol, rank: $rank, price: $price)";
  }
}
