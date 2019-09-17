class Today {
  String title;
  String subTitle;
  String content;
  String imageUrl;
  int fontColor;

  Today(this.title, this.subTitle, this.content, this.imageUrl, this.fontColor);
}

List<Today> todayList = [
  Today(
      "三吉彩花",
      "演员、模特、歌手",
      "    三吉彩花（ Ayaka Miyoshi），1996年6月18日出生于琦玉县，日本影视女演员、模特、歌手，隶属于Amuse演艺事务所，女子团体樱花学院一期生。",
      "images/sancai_chunhua.jpeg",
      0xFFFFFFFF),
  Today(
      "石原里美",
      "演员、主持人",
      "    石原里美，1986年12月24日出生于日本东京，日本女演员、主持人。2002年，参加HORIPRO公司第27回艺人新人选拔，获得最佳新人“完美少女”奖，从而正式以女演员的身份进入演艺圈。",
      "images/shiyuan_limei.jpg",
      0xFF000000),
  Today(
      "新垣结衣",
      "演员、歌手、模特",
      "    新垣结衣（Aragaki Yui），1988年6月11日出生于日本冲绳县那霸市。日本女演员、歌手、模特。2001年，参加《nicola》杂志模特选拔并获得了最优秀大奖。2005年，出演了电视剧处女作《涩谷15》。2006年3月3日，发行了个人首本写真集《ちゅら☆ちゅら》",
      "images/xinyuan_jieyi.jpg",
      0xFF000000),
  Today(
      "吉冈里帆",
      "影视演员、写真模特",
      "    吉冈里帆（Riho Yoshioka），1993年1月15日出生于日本京都府，影视演员、写真模特，隶属于A-Team事务所 [1]  。",
      "images/jigang_lifan.jpg",
      0xFF9E9E9E),
];
