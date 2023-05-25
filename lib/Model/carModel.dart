import 'package:myapp/Model/UserModel.dart';

class car_model {
  final String? CompanyCar;
  final String? ModelCar;
  final String? CarColor;
  final String? PlateNumber;
  final UserModel? user;

  car_model(
      {this.CompanyCar,
      this.ModelCar,
      this.CarColor,
      this.PlateNumber,
      this.user});
  factory car_model.fromjson(var json) {
    return car_model(
        CompanyCar: json["car_company"],
        ModelCar: json["car_model"],
        CarColor: json["car_color"],
        PlateNumber: json["Plate_number"],
        user: json["user"]);
  }
  Map<String, dynamic> tojson() {
    return {
      "car_company": CompanyCar,
      "car_model": ModelCar,
      "car_color": CarColor,
      "Plate_number": PlateNumber,
      "user": user
    };
  }
}
