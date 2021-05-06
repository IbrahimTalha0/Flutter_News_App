import 'package:flutter/material.dart';

class CategoryCardModel {
  String categoryName;
  String categoryImage;
  String rssUrl;

  CategoryCardModel(
      {@required this.categoryName,
      @required this.categoryImage,
      @required this.rssUrl});

  static List<CategoryCardModel> getCategories() {
    List<CategoryCardModel> myCategories = [];

    myCategories.add(CategoryCardModel(
        categoryName: "Business",
        categoryImage:
            "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80",
        rssUrl: "https://t24.com.tr/rss"));

    myCategories.add(CategoryCardModel(
        categoryName: "Entertainment",
        categoryImage:
            "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/dunya"));

    myCategories.add(CategoryCardModel(
        categoryName: "General",
        categoryImage:
            "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        rssUrl: "https://t24.com.tr/rss/haber/dunya"));

    myCategories.add(CategoryCardModel(
        categoryName: "Health",
        categoryImage:
            "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/dunya"));

    myCategories.add(CategoryCardModel(
        categoryName: "Sports",
        categoryImage:
            "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/dunya"));

    return myCategories;
  }
}
