import 'dart:convert';

class DriverRoute {
  DriverRoute({
    required this.id,
    required this.driverId,
    required this.destiny,
    required this.seating,
    required this.startingPoint,
    required this.departureTime,
    required this.departureDate,
    required this.cost,
    required this.passengers,
  });

  int id;
  int driverId;
  String destiny;
  int seating;
  String startingPoint;
  String departureTime;
  String departureDate;
  int cost;
  List<dynamic> passengers;

  factory DriverRoute.fromJson(String str) =>
      DriverRoute.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DriverRoute.fromMap(Map<String, dynamic> json) => DriverRoute(
        id: json["id"],
        driverId: json["driverId"],
        destiny: json["destiny"],
        seating: json["seating"],
        startingPoint: json["starting_point"],
        departureTime: json["departure_time"],
        departureDate: json["departure_date"],
        cost: json["cost"],
        passengers: List<dynamic>.from(json["passengers"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "driverId": driverId,
        "destiny": destiny,
        "seating": seating,
        "starting_point": startingPoint,
        "departure_time": departureTime,
        "departure_date": departureDate,
        "cost": cost,
        "passengers": List<dynamic>.from(passengers.map((x) => x)),
      };
}