import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/about_company/data/services/about_company_services.dart';
import 'package:galaxyxgate/features/about_company/logic/cubit/about_company_cubit.dart';
import 'package:galaxyxgate/features/about_company/screens/about_company_page.dart';

class AboutCompanyBlocProvider extends StatelessWidget {
  const AboutCompanyBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutCompanyCubit(
          aboutCompanyServices: AboutCompanyServices(dioHelper: DioHelper()))
        ..getCompanyInfo(),
      child: const AboutCompanyPage(),
    );
  }
}
