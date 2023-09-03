class ItemModel {
  final int _id;
  final List<String> _imgPath;
  final String _itemPrice;
  final String _itemDescription;
  bool isNew;
  bool isFavorite;

  ItemModel(this._id, this._imgPath, this._itemPrice, this._itemDescription,
      {this.isNew = false, this.isFavorite = false});
  int get id => _id;
  List<String> get imgPath => _imgPath;
  String get itemPrice => _itemPrice;
  String get itemDescription => _itemDescription;
}
