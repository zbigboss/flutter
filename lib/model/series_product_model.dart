class SeriesProductModel {
  List<FilterRowList>? filterRowList;
  int? listId;
  String? listTitle;
  int? listType;
  int? modelTitle;
  PageInfo? pageInfo;
  List<ProductList>? productList;
  String? searchKey;
  int? testId;
  String? title;

  SeriesProductModel(
      {this.filterRowList,
      this.listId,
      this.listTitle,
      this.listType,
      this.modelTitle,
      this.pageInfo,
      this.productList,
      this.searchKey,
      this.testId,
      this.title});

  SeriesProductModel.fromJson(Map<String, dynamic> json) {
    if (json['filterRowList'] != null) {
      filterRowList = <FilterRowList>[];
      json['filterRowList'].forEach((v) {
        filterRowList!.add(new FilterRowList.fromJson(v));
      });
    }
    listId = json['listId'];
    listTitle = json['listTitle'];
    listType = json['listType'];
    modelTitle = json['modelTitle'];
    pageInfo = json['pageInfo'] != null
        ? new PageInfo.fromJson(json['pageInfo'])
        : null;
    if (json['productList'] != null) {
      productList = <ProductList>[];
      json['productList'].forEach((v) {
        productList!.add(new ProductList.fromJson(v));
      });
    }
    searchKey = json['searchKey'];
    testId = json['testId'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filterRowList != null) {
      data['filterRowList'] =
          this.filterRowList!.map((v) => v.toJson()).toList();
    }
    data['listId'] = this.listId;
    data['listTitle'] = this.listTitle;
    data['listType'] = this.listType;
    data['modelTitle'] = this.modelTitle;
    if (this.pageInfo != null) {
      data['pageInfo'] = this.pageInfo!.toJson();
    }
    if (this.productList != null) {
      data['productList'] = this.productList!.map((v) => v.toJson()).toList();
    }
    data['searchKey'] = this.searchKey;
    data['testId'] = this.testId;
    data['title'] = this.title;
    return data;
  }
}

class FilterRowList {
  String? rowKey;
  String? rowName;
  int? rowType;
  List<RowValue>? rowValue;
  int? showPosition;
  List<TreeValue>? treeValue;

  FilterRowList(
      {this.rowKey,
      this.rowName,
      this.rowType,
      this.rowValue,
      this.showPosition,
      this.treeValue});

  FilterRowList.fromJson(Map<String, dynamic> json) {
    rowKey = json['rowKey'];
    rowName = json['rowName'];
    rowType = json['rowType'];
    if (json['rowValue'] != null) {
      rowValue = <RowValue>[];
      json['rowValue'].forEach((v) {
        rowValue!.add(new RowValue.fromJson(v));
      });
    }
    showPosition = json['showPosition'];
    if (json['treeValue'] != null) {
      treeValue = <TreeValue>[];
      json['treeValue'].forEach((v) {
        treeValue!.add(new TreeValue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowKey'] = this.rowKey;
    data['rowName'] = this.rowName;
    data['rowType'] = this.rowType;
    if (this.rowValue != null) {
      data['rowValue'] = this.rowValue!.map((v) => v.toJson()).toList();
    }
    data['showPosition'] = this.showPosition;
    if (this.treeValue != null) {
      data['treeValue'] = this.treeValue!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RowValue {
  int? filterId;
  String? filterName;
  int? filterType;
  String? colorName;

  RowValue({this.filterId, this.filterName, this.filterType, this.colorName});

  RowValue.fromJson(Map<String, dynamic> json) {
    filterId = json['filterId'];
    filterName = json['filterName'];
    filterType = json['filterType'];
    colorName = json['colorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filterId'] = this.filterId;
    data['filterName'] = this.filterName;
    data['filterType'] = this.filterType;
    data['colorName'] = this.colorName;
    return data;
  }
}

class TreeValue {
  List<Childrens>? childrens;
  int? productCategoryId;
  String? productCategoryName;

  TreeValue({this.childrens, this.productCategoryId, this.productCategoryName});

  TreeValue.fromJson(Map<String, dynamic> json) {
    if (json['childrens'] != null) {
      childrens = <Childrens>[];
      json['childrens'].forEach((v) {
        childrens!.add(new Childrens.fromJson(v));
      });
    }
    productCategoryId = json['productCategoryId'];
    productCategoryName = json['productCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.childrens != null) {
      data['childrens'] = this.childrens!.map((v) => v.toJson()).toList();
    }
    data['productCategoryId'] = this.productCategoryId;
    data['productCategoryName'] = this.productCategoryName;
    return data;
  }
}

class Childrens {
  int? productCategoryId;
  String? productCategoryName;

  Childrens({this.productCategoryId, this.productCategoryName});

  Childrens.fromJson(Map<String, dynamic> json) {
    productCategoryId = json['productCategoryId'];
    productCategoryName = json['productCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productCategoryId'] = this.productCategoryId;
    data['productCategoryName'] = this.productCategoryName;
    return data;
  }
}

class PageInfo {
  int? currentPage;
  int? isBottom;
  int? totalPage;
  int? totalSize;

  PageInfo({this.currentPage, this.isBottom, this.totalPage, this.totalSize});

  PageInfo.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    isBottom = json['isBottom'];
    totalPage = json['totalPage'];
    totalSize = json['totalSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['isBottom'] = this.isBottom;
    data['totalPage'] = this.totalPage;
    data['totalSize'] = this.totalSize;
    return data;
  }
}

class ProductList {
  int? isFavor;
  bool? isShowProductStyle;
  int? itemType;
  int? moduleId;
  int? moduleTitle;
  String? productCategory;
  int? productCategoryId;
  int? productId;
  String? productName;
  List<ProductStyle>? productStyle;
  String? productUniqueName;
  int? sellingOut;
  int? soldOut;
  String? spuCode;
  String? sellingOutDesc;

  ProductList(
      {this.isFavor,
      this.isShowProductStyle,
      this.itemType,
      this.moduleId,
      this.moduleTitle,
      this.productCategory,
      this.productCategoryId,
      this.productId,
      this.productName,
      this.productStyle,
      this.productUniqueName,
      this.sellingOut,
      this.soldOut,
      this.spuCode,
      this.sellingOutDesc});

  ProductList.fromJson(Map<String, dynamic> json) {
    isFavor = json['isFavor'];
    isShowProductStyle = json['isShowProductStyle'];
    itemType = json['itemType'];
    moduleId = json['moduleId'];
    moduleTitle = json['moduleTitle'];
    productCategory = json['productCategory'];
    productCategoryId = json['productCategoryId'];
    productId = json['productId'];
    productName = json['productName'];
    if (json['productStyle'] != null) {
      productStyle = <ProductStyle>[];
      json['productStyle'].forEach((v) {
        productStyle!.add(new ProductStyle.fromJson(v));
      });
    }
    productUniqueName = json['productUniqueName'];
    sellingOut = json['sellingOut'];
    soldOut = json['soldOut'];
    spuCode = json['spuCode'];
    sellingOutDesc = json['sellingOutDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFavor'] = this.isFavor;
    data['isShowProductStyle'] = this.isShowProductStyle;
    data['itemType'] = this.itemType;
    data['moduleId'] = this.moduleId;
    data['moduleTitle'] = this.moduleTitle;
    data['productCategory'] = this.productCategory;
    data['productCategoryId'] = this.productCategoryId;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    if (this.productStyle != null) {
      data['productStyle'] = this.productStyle!.map((v) => v.toJson()).toList();
    }
    data['productUniqueName'] = this.productUniqueName;
    data['sellingOut'] = this.sellingOut;
    data['soldOut'] = this.soldOut;
    data['spuCode'] = this.spuCode;
    data['sellingOutDesc'] = this.sellingOutDesc;
    return data;
  }
}

class ProductStyle {
  String? linkUrl;
  String? newLinkUrl;
  String? salePrice;
  int? soldOut;
  int? sort;
  int? stockNum;
  int? styleId;
  String? styleImage;
  String? thumbImage;
  String? leftUpTag;
  String? originalPrice;

  ProductStyle(
      {this.linkUrl,
      this.newLinkUrl,
      this.salePrice,
      this.soldOut,
      this.sort,
      this.stockNum,
      this.styleId,
      this.styleImage,
      this.thumbImage,
      this.leftUpTag,
      this.originalPrice});

  ProductStyle.fromJson(Map<String, dynamic> json) {
    linkUrl = json['linkUrl'];
    newLinkUrl = json['newLinkUrl'];
    salePrice = json['salePrice'];
    soldOut = json['soldOut'];
    sort = json['sort'];
    stockNum = json['stockNum'];
    styleId = json['styleId'];
    styleImage = json['styleImage'];
    thumbImage = json['thumbImage'];
    leftUpTag = json['leftUpTag'];
    originalPrice = json['originalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkUrl'] = this.linkUrl;
    data['newLinkUrl'] = this.newLinkUrl;
    data['salePrice'] = this.salePrice;
    data['soldOut'] = this.soldOut;
    data['sort'] = this.sort;
    data['stockNum'] = this.stockNum;
    data['styleId'] = this.styleId;
    data['styleImage'] = this.styleImage;
    data['thumbImage'] = this.thumbImage;
    data['leftUpTag'] = this.leftUpTag;
    data['originalPrice'] = this.originalPrice;
    return data;
  }
}
