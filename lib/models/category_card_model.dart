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
        categoryName: "Dünya",
        categoryImage:
            "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2252&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/dunya"));

    myCategories.add(CategoryCardModel(
        categoryName: "Magazin",
        categoryImage:
            "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/magazin"));

    myCategories.add(CategoryCardModel(
        categoryName: "Genel",
        categoryImage:
            "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        rssUrl: "https://t24.com.tr/rss"));

    myCategories.add(CategoryCardModel(
        categoryName: "Sağlık",
        categoryImage:
            "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/saglik"));

    myCategories.add(CategoryCardModel(
        categoryName: "Spor",
        categoryImage:
            "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/spor"));

    myCategories.add(CategoryCardModel(
        categoryName: "Eğitim",
        categoryImage:
            "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/egitim"));

    myCategories.add(CategoryCardModel(
        categoryName: "Koronavirüs",
        categoryImage:
            "https://images.unsplash.com/photo-1584483766114-2cea6facdf57?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/koronavirus"));

    myCategories.add(CategoryCardModel(
        categoryName: "Siyaset",
        categoryImage:
            "https://images.unsplash.com/photo-1523995462485-3d171b5c8fa9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/politika"));

    myCategories.add(CategoryCardModel(
        categoryName: "Ekonomi",
        categoryImage:
            "https://images.unsplash.com/photo-1515548212260-ac87067b15ab?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/ekonomi"));

    myCategories.add(CategoryCardModel(
        categoryName: "Bilim/Teknoloji",
        categoryImage:
            "https://images.unsplash.com/photo-1517976487492-5750f3195933?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80",
        rssUrl: "https://t24.com.tr/rss/haber/bilim-teknoloji"));

    return myCategories;
  }
}
