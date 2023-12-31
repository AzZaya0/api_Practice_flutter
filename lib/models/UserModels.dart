class UserModel {
  int? id;
  String? userId;
  String? title;
  String? body;
  String? slug;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.userId,
      this.title,
      this.body,
      this.slug,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
