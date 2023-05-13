
class Product {
  String name;
  double price;
  int qty=1;
  int qntty;
  List imagesUrl;
  String documentId;
  String suppId;
  Product({
    required this.name,
    required this.suppId,
    required this.imagesUrl,
    required this.qntty,
    required this.qty,
    required this.documentId,
    required this.price,

  });
  void increase(){
    qty++;
  }
  
  void decrease(){
    qty--;
  }
}