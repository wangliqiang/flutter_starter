import 'package:flutter/material.dart';
import 'package:flutter_starter/today/today.dart';

import 'anim/animation.dart';
import 'appbar/bottom_appbar.dart';
import 'beautycard/beauty_card.dart';
import 'character/character_list.dart';
import 'creditcard/credit_card.dart';
import 'flare/flare.dart';
import 'keepalivestate/keep_alive_state.dart';
import 'searchbar/search_bar.dart';
import 'tabbar/bottom_tabbar.dart';

//路由集合
var routes = {
  "/flare": (BuildContext context) => Flare(),
  "/character": (BuildContext context) => CharacterList(),
  "/credit_card": (BuildContext context) => CreditCard(),
  "/today": (BuildContext context) => Today(),
  "/beauty_card": (BuildContext context) => beautyCard(),
  "/keep_alive_state": (BuildContext context) => KeepAliveState(),
  "/page_animation": (BuildContext context) => FirstPage(),
  "/bottom_tabbar": (BuildContext context) => bottomTabbar(),
  "/bottom_appbar": (BuildContext context) => bottomAppBar(),
  "/search_bar": (BuildContext context) => SearchBar(),
};

List<PageInfo> pageList = [
  PageInfo(
      route: "/flare",
      imagePath:
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1377700654,4207098182&fm=15&gp=0.jpg",
      title: "Flare动画",
      subTitle: "Complex Animation"),
  PageInfo(
      route: "/character",
      imagePath:
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569553986&di=8835f36ab90ef205a51a6fb02e5d256b&imgtype=jpg&er=1&src=http%3A%2F%2Fimage1.xyzs.com%2Fupload%2F4f%2F4a%2F404%2F20150506%2F143085709269563_0.jpg",
      title: "神偷奶爸",
      subTitle: "左右滑动的卡片动画"),
  PageInfo(
      route: "/credit_card",
      imagePath:
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2739671376,2107734559&fm=26&gp=0.jpg",
      title: "信用卡动画",
      subTitle: "上下滑动的卡片动画"),
  PageInfo(
      route: "/today",
      imagePath:
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568959510368&di=8d471dced321d0d9487ccae4f6569d18&imgtype=0&src=http%3A%2F%2Fimg0w.pconline.com.cn%2Fpconline%2F1504%2F23%2Fspcgroup%2Fwidth_640%2Cqua_30%2F6375636_21.jpg",
      title: "Today",
      subTitle: "AppStore 首页动效"),
  PageInfo(
      route: "/beauty_card",
      imagePath:
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568959640544&di=f45ac0ba44dfc133512407164525333d&imgtype=0&src=http%3A%2F%2Fimg3.doubanio.com%2Fview%2Fgroup_topic%2Flarge%2Fpublic%2Fp78350321.jpg",
      title: "精美卡片",
      subTitle: "类似排行的卡片动画"),
  PageInfo(
      route: "/keep_alive_state",
      imagePath:
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2435648396,3879384970&fm=26&gp=0.jpg",
      title: "保持页面状态",
      subTitle: "多个页面切换，状态不会消失"),
  PageInfo(
      route: "/page_animation",
      imagePath:
          "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1668731370,1082837705&fm=26&gp=0.jpg",
      title: "页面动画",
      subTitle: "fade,scale,rotate,slide..."),
  PageInfo(
      route: "/bottom_tabbar",
      imagePath:
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=426605109,2382879281&fm=26&gp=0.jpg",
      title: "Tabbar",
      subTitle: "底部导航栏"),
  PageInfo(
      route: "/bottom_appbar",
      imagePath:
          "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2074211691,2923359456&fm=11&gp=0.jpg",
      title: "AppBar",
      subTitle: "底部工具栏（更灵活）"),
  PageInfo(
      route: "/search_bar",
      imagePath:
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4206348751,4177014175&fm=26&gp=0.jpg",
      title: "SearchBar",
      subTitle: "搜索栏动画"),
];

class PageInfo {
  String route;
  String imagePath;
  String title;
  String subTitle;

  PageInfo({
    this.route,
    this.imagePath,
    this.title,
    this.subTitle,
  });
}
