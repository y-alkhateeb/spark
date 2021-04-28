import 'dart:convert';

class RegisterModel {
  RegisterModel({
    this.phoneNumber,
    this.userName,
    this.name,
    this.imageUrl,
    this.id,
    this.createDate,
    this.lastModifiedDate,
    this.creatorId,
    this.modifierId,
    this.creator,
    this.modifier,
  });

  final String? phoneNumber;
  final String? userName;
  final String? name;
  final String? imageUrl;
  final String? id;
  final String? createDate;
  final String? lastModifiedDate;
  final String? creatorId;
  final String? modifierId;
  final String? creator;
  final String? modifier;

  factory RegisterModel.fromJson(String str) => RegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    userName: json["userName"] == null ? null : json["userName"],
    name: json["name"] == null ? null : json["name"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    id: json["id"] == null ? null : json["id"],
    createDate: json["createDate"] == null ? null : json["createDate"],
    lastModifiedDate: json["lastModifiedDate"] == null ? null : json["lastModifiedDate"],
    creatorId: json["creatorId"] == null ? null : json["creatorId"],
    modifierId: json["modifierId"] == null ? null : json["modifierId"],
    creator: json["creator"] == null ? null : json["creator"],
    modifier: json["modifier"] == null ? null : json["modifier"],
  );

  Map<String, dynamic> toMap() => {
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "userName": userName == null ? null : userName,
    "name": name == null ? null : name,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "id": id == null ? null : id,
    "createDate": createDate == null ? null : createDate,
    "lastModifiedDate": lastModifiedDate == null ? null : lastModifiedDate,
    "creatorId": creatorId == null ? null : creatorId,
    "modifierId": modifierId == null ? null : modifierId,
    "creator": creator == null ? null : creator,
    "modifier": modifier == null ? null : modifier,
  };
}