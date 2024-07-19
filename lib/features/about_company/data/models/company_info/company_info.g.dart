// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfo _$CompanyInfoFromJson(Map<String, dynamic> json) => CompanyInfo(
      headquarters: json['headquarters'] == null
          ? null
          : Headquarters.fromJson(json['headquarters'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      name: json['name'] as String?,
      founder: json['founder'] as String?,
      founded: (json['founded'] as num?)?.toInt(),
      employees: (json['employees'] as num?)?.toInt(),
      vehicles: (json['vehicles'] as num?)?.toInt(),
      launchSites: (json['launch_sites'] as num?)?.toInt(),
      testSites: (json['test_sites'] as num?)?.toInt(),
      ceo: json['ceo'] as String?,
      cto: json['cto'] as String?,
      coo: json['coo'] as String?,
      ctoPropulsion: json['cto_propulsion'] as String?,
      valuation: (json['valuation'] as num?)?.toInt(),
      summary: json['summary'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CompanyInfoToJson(CompanyInfo instance) =>
    <String, dynamic>{
      'headquarters': instance.headquarters?.toJson(),
      'links': instance.links?.toJson(),
      'name': instance.name,
      'founder': instance.founder,
      'founded': instance.founded,
      'employees': instance.employees,
      'vehicles': instance.vehicles,
      'launch_sites': instance.launchSites,
      'test_sites': instance.testSites,
      'ceo': instance.ceo,
      'cto': instance.cto,
      'coo': instance.coo,
      'cto_propulsion': instance.ctoPropulsion,
      'valuation': instance.valuation,
      'summary': instance.summary,
      'id': instance.id,
    };
