import 'dart:convert';
class Passenger {
  Passenger({
    required this.id,
    required this.name,
    required this.age,
    required this.dni,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.pfp,
    required this.puntuacion,
    required this.createAt,
    required this.updateAt
  });

  int id;
  String name;
  int age;
  String dni;
  String email;
  String password;
  String phoneNumber;
  String pfp;
  int puntuacion;
  String createAt;
  String updateAt;

  factory Passenger.fromJson(String str) => Passenger.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Passenger.fromMap(Map<String, dynamic> json) => Passenger(
    id: json["id"],
    name: json["name"],
    age: json["age"],
    dni: json["dni"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phoneNumber"],
    pfp: json["pfp"],
    puntuacion: json["puntuacion"],
    createAt: json["createAt"],
    updateAt: json["updateAt"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "age": age,
    "dni": dni,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber,
    "pfp": pfp,
    "puntuacion": puntuacion,
  };
}