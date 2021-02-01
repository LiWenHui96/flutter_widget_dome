/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/01/29 5:27 PM
/// @Describe:

class WidgetInfoModel {
  String type;
  String title;

  WidgetInfoModel({
    this.type,
    this.title,
  });

  WidgetInfoModel.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    title = json["title"];
  }
}
