import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/features/about_company/data/models/company_info/company_info.dart';
import 'package:galaxyxgate/features/about_company/data/services/about_company_services.dart';

part 'about_company_state.dart';

class AboutCompanyCubit extends Cubit<AboutCompanyState> {
  AboutCompanyCubit({required AboutCompanyServices aboutCompanyServices})
      : super(AboutCompanyInitial()) {
    _aboutCompanyServices = aboutCompanyServices;
  }

  late AboutCompanyServices _aboutCompanyServices;

  static ScrollController scrollController = ScrollController();

  Future<void> getCompanyInfo() async {
    emit(GetCompanyInfoLoading());
    Either<ServerFailure, CompanyInfo> result =
        await _aboutCompanyServices.getCompanyData();
    result.fold(
      (error) => emit(
        GetCompanyInfoFailuer(
          errorMessage: error.errMessage,
        ),
      ),
      (companyInfo) => emit(
        GetCompanyInfoSuccess(companyInfo: companyInfo),
      ),
    );
  }
}
