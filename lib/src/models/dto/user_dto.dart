// To parse this JSON data, do
//
//     final userDto = userDtoFromJson(jsonString);

import 'dart:convert';

UserDto userDtoFromJson(String str) => UserDto.fromJson(json.decode(str));

String userDtoToJson(UserDto data) => json.encode(data.toJson());

class UserDto {
    int id;
    String name;
    String email;
    String pass;

    UserDto({
        required this.id,
        required this.name,
        required this.email,
        required this.pass,
    });

    factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        pass: json["pass"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "pass": pass,
    };
}
