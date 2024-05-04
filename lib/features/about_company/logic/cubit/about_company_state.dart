part of 'about_company_cubit.dart';

sealed class AboutCompanyState {}

final class AboutCompanyInitial extends AboutCompanyState {}

final class GetCompanyInfoLoading extends AboutCompanyState {}

final class GetCompanyInfoSuccess extends AboutCompanyState {
  CompanyInfo companyInfo;
  GetCompanyInfoSuccess({required this.companyInfo});
}

final class GetCompanyInfoFailuer extends AboutCompanyState {
  String errorMessage;
  GetCompanyInfoFailuer({required this.errorMessage});
}
