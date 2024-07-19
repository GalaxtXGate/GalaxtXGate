import 'package:galaxyxgate/features/about_company/data/models/headquarters/headquarters.dart';
import 'package:galaxyxgate/features/about_company/data/models/links/links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_info.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyInfo {
  Headquarters? headquarters;
  Links? links;
  String? name;
  String? founder;
  int? founded;
  int? employees;
  int? vehicles;
  int? launchSites;
  int? testSites;
  String? ceo;
  String? cto;
  String? coo;
  String? ctoPropulsion;
  int? valuation;
  String? summary;
  String? id;

  CompanyInfo(
      {this.headquarters,
      this.links,
      this.name,
      this.founder,
      this.founded,
      this.employees,
      this.vehicles,
      this.launchSites,
      this.testSites,
      this.ceo,
      this.cto,
      this.coo,
      this.ctoPropulsion,
      this.valuation,
      this.summary,
      this.id});
  factory CompanyInfo.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoToJson(this);
}
