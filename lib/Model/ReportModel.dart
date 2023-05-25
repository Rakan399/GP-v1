import 'package:myapp/Model/UserModel.dart';
import 'package:myapp/Model/carModel.dart';

class ReportModel {
  final car_model? car;
  final String? type;
  final DateTime? createdAt;
  final UserModel? reporter;
  final UserModel? owner;

  ReportModel({
    this.car,
    this.type,
    this.createdAt,
    this.reporter,
    this.owner,
  });
  factory ReportModel.fromjson(var json) {
    return ReportModel(
      type: json["type"],
      createdAt: json["created_At"].toDate(),
      reporter: UserModel.fromJson(json["reporter"]),
      car: car_model.fromjson(json["car"]),
      owner: json["owner"] == null ? null : UserModel.fromJson(json["owner"]),
    );
  }
  Map<String, dynamic> tojson() {
    return {
      "type": type,
      "created_At": createdAt,
      "car": car!.tojson(),
      "reporter": reporter!.toJson(),
      "owner": owner == null ? null : owner!.toJson(),
    };
  }
}
