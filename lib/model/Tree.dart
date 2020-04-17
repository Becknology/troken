
class Tree {

  String token;
  String mapUrl;
  String imageUrl;
  String treeCaptureTime;
  String latitude;
  String longitude;
  String region;
  bool isSelected;

  Tree(this.token, this.mapUrl, this.imageUrl, this.treeCaptureTime, this.latitude, this.longitude, this.region, {this.isSelected = false});

}
