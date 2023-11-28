class ReplicatorModel {
  String? bundle;
  int? start;
  int? end;
  String? startDate;
  String? endDate;
  String? bundleType;
  List<BundleContent>? bundleContent;

  ReplicatorModel(
      {this.bundle, this.start, this.end, this.startDate, this.endDate, this.bundleType, this.bundleContent});

  ReplicatorModel.fromJson(Map<String, dynamic> json) {
    bundle = json['bundle'];
    start = json['start'];
    end = json['end'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    bundleType = json['bundleType'];
    if (json['bundleContent'] != null) {
      bundleContent = <BundleContent>[];
      json['bundleContent'].forEach((v) {
        bundleContent!.add(BundleContent.fromJson(v));
      });
    }
  }
}

class BundleContent {
  String? item;
  int? cost;
  ItemType? itemType;

  BundleContent({this.item, this.cost, this.itemType});

  BundleContent.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    cost = json['cost'];
    itemType = json['itemType'] != null ? ItemType.fromJson(json['itemType']) : null;
  }
}

class ItemType {
  String? name;
  String? rarity;
  String? asset;
  String? rarityHex;

  ItemType({this.name, this.rarity, this.asset, this.rarityHex});

  ItemType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rarity = json['rarity'];
    asset = json['asset'];
    rarityHex = json['rarityHex'];
  }
}
