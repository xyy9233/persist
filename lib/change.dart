/*
import 'dart:convert';
RiBaos riBaosFromJson(String str) => RiBaos.fromJson(json.decode(str));
String riBaosToJson(RiBaos data) => json.encode(data.toJson());
*/

class RiBaos {
  final String date;
  final List<Story> topStories;
  final List<Story> stories;




  RiBaos.fromJson(Map<String, dynamic> json)
      : this.date = json["date"],
        this.stories =
        List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
        this.topStories =
        (json['top_stories']==null)?[]:
        List<Story>.from(json["top_stories"].map((x) => Story.fromJson(x)))
  ;}



class Story {
  final String title;
  final String url;
  final String hint;
  final String image;
  //final String imageHue;

  Story.fromJson(Map<String, dynamic> json)
      : this.title = json['title'],
        this.url = json['url'],
        this.hint = json['hint'],
  //this.imageHue = json['image_hue'],
  // 这里需要做个判断，[top_stories]中的字段为`image`，而[stories]中的字段为`images`
        this.image = (json['images'] == null) ? json['image'] :
        List<String>.from(json["images"]).first;
}