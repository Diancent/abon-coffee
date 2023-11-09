class Activity {
  String imageUrl;
  String desc;
  String name;
  String type;
  List<String> startTimes;
  double rating;
  int price;

  Activity({
    this.imageUrl,
    this.desc,
    this.name,
    this.type,
    this.startTimes,
    this.rating = 0.0,
    this.price,
  });
}
