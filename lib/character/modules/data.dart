import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character(this.name, this.imagePath, this.description, this.colors);
}

List characters = [
  Character(
      "小黄人",
      "assets/images/kevin_minions.png",
      "小黄人，是格鲁的黄色小兵军团，它是由格鲁和纳法里奥博士用变种DNA、脂肪酸和香蕉泥组成的胶囊状生物，穿着蓝色背带装，口齿不清，语言为混杂语。他们帮助格鲁盗取月球，同时也是三位女孩的朋友，非常喜欢艾格尼丝，思想怪异，行为古怪，心地善良。因为是由香蕉泥组成的，所以小黄人酷爱香蕉。",
      [Colors.orange.shade200, Colors.deepOrange.shade400]),
  Character(
      "艾格尼丝",
      "assets/images/agnes_gru.png",
      "艾格尼丝是三位孤儿中最小的，在孤儿院中与两位姐姐相依为命，非常喜欢独角兽，睡前喜欢听格鲁讲故事，不然难以入睡。她特别爱吃糖果，是一个活泼可爱的小女孩。",
      [Colors.pink.shade200, Colors.redAccent.shade400]),
];
