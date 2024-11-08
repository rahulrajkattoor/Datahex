// To parse this JSON data, do
//
//     final use = useFromJson(jsonString);

import 'dart:convert';

Use useFromJson(String str) => Use.fromJson(json.decode(str));

String useToJson(Use data) => json.encode(data.toJson());

class Use {
  User user;
  List<Menu> menu;
  String token;
  bool success;
  String message;

  Use({
    required this.user,
    required this.menu,
    required this.token,
    required this.success,
    required this.message,
  });

  factory Use.fromJson(Map<String, dynamic> json) => Use(
    user: User.fromJson(json["user"]),
    menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
    token: json["token"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
    "token": token,
    "success": success,
    "message": message,
  };
}

class Menu {
  String id;
  String label;
  int sequence;
  String icon;
  bool status;
  bool isLink;
  bool hideMenu;
  bool hideHeader;
  bool showInMenu;
  String path;
  String element;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Privilege privilege;
  List<dynamic> submenus;

  Menu({
    required this.id,
    required this.label,
    required this.sequence,
    required this.icon,
    required this.status,
    required this.isLink,
    required this.hideMenu,
    required this.hideHeader,
    required this.showInMenu,
    required this.path,
    required this.element,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.privilege,
    required this.submenus,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json["_id"],
    label: json["label"],
    sequence: json["sequence"],
    icon: json["icon"],
    status: json["status"],
    isLink: json["isLink"],
    hideMenu: json["hideMenu"],
    hideHeader: json["hideHeader"],
    showInMenu: json["showInMenu"],
    path: json["path"],
    element: json["element"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    privilege: Privilege.fromJson(json["privilege"]),
    submenus: List<dynamic>.from(json["submenus"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "label": label,
    "sequence": sequence,
    "icon": icon,
    "status": status,
    "isLink": isLink,
    "hideMenu": hideMenu,
    "hideHeader": hideHeader,
    "showInMenu": showInMenu,
    "path": path,
    "element": element,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "privilege": privilege.toJson(),
    "submenus": List<dynamic>.from(submenus.map((x) => x)),
  };
}

class Privilege {
  String id;
  String menu;
  String userType;
  bool status;
  bool add;
  bool update;
  bool delete;
  bool clone;
  bool privilegeExport;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Privilege({
    required this.id,
    required this.menu,
    required this.userType,
    required this.status,
    required this.add,
    required this.update,
    required this.delete,
    required this.clone,
    required this.privilegeExport,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Privilege.fromJson(Map<String, dynamic> json) => Privilege(
    id: json["_id"],
    menu: json["menu"],
    userType: json["userType"],
    status: json["status"],
    add: json["add"],
    update: json["update"],
    delete: json["delete"],
    clone: json["clone"],
    privilegeExport: json["export"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "menu": menu,
    "userType": userType,
    "status": status,
    "add": add,
    "update": update,
    "delete": delete,
    "clone": clone,
    "export": privilegeExport,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class User {
  UserType userType;
  String email;
  String userDisplayName;
  String id;
  String fullName;
  String student;

  User({
    required this.userType,
    required this.email,
    required this.userDisplayName,
    required this.id,
    required this.fullName,
    required this.student,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userType: UserType.fromJson(json["userType"]),
    email: json["email"],
    userDisplayName: json["userDisplayName"],
    id: json["_id"],
    fullName: json["fullName"],
    student: json["student"],
  );

  Map<String, dynamic> toJson() => {
    "userType": userType.toJson(),
    "email": email,
    "userDisplayName": userDisplayName,
    "_id": id,
    "fullName": fullName,
    "student": student,
  };
}

class UserType {
  String id;
  String role;
  String roleDisplayName;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  UserType({
    required this.id,
    required this.role,
    required this.roleDisplayName,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserType.fromJson(Map<String, dynamic> json) => UserType(
    id: json["_id"],
    role: json["role"],
    roleDisplayName: json["roleDisplayName"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "role": role,
    "roleDisplayName": roleDisplayName,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
