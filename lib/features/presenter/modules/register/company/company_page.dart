import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/company/company_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/mult_info_card/mult_info_card.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/three_info_card/three_info_card.dart';
import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/bold_title_info_card/bold_title_info_card.dart';
import 'controller/company_controller.dart';

class CompanyPage extends StatelessWidget {
  final ArgParams args;
  static const String routePath = AppRoutes.appCompanyPage;

  static void navigate(ArgParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static Future<Object?> push(ArgParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  static void pop() =>
      Modular.to.pop(routePath);

  const CompanyPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {

    final controller = Modular.get<CompanyController>();
    controller.getCompanyById(args);


    return BackgroundWidget(
        scrollable: true,
        appBar: const CustomAppBarWidget(
          appBarType: AppBarType.centeredTitleAndBackArrow,
          title: AppStringsPortuguese.singularCompanyTitle,
          callback: CompanyListPage.pop,
        ),
        child: Observer(
          builder: (context) => controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      BoldTitleInfoCard(
                          titleOne: AppStringsPortuguese.nameField,
                          dataOne: controller.company?.name ?? ""),
                      const SizedBox(
                        height: 10,
                      ),
                      BoldTitleInfoCard(
                          titleOne: AppStringsPortuguese.companyIdentifierTitle, dataOne: controller.company?.legalDocumentNumber ?? ""),
                      const SizedBox(
                        height: 10,
                      ),
                      BoldTitleInfoCard(titleOne: AppStringsPortuguese.typeLabel, dataOne: controller.getCompanyType()),
                      const SizedBox(
                        height: 10,
                      ),
                      BoldTitleInfoCard(
                          titleOne: AppStringsPortuguese.companySegment, dataOne: (controller.company?.segments ?? [])
                          .map((segment) => segment.name)
                          .where((name) => name != null)
                          .cast<String>()
                          .join('\n')),
                      const SizedBox(
                        height: 10,
                      ),
                      ThreeInfoCard(
                          title: AppStringsPortuguese.contactLabel,
                          info1: (AppStringsPortuguese.employeePhoneLabel, controller.company?.phoneNumber ?? ""),
                          info2: (AppStringsPortuguese.whatsAppLabel, controller.company?.whatsappNumber ?? ""),
                          info3: (AppStringsPortuguese.emailLabel, controller.company?.email ?? "")),
                      const SizedBox(
                        height: 10,
                      ),
                      MultInfoCard(title: AppStringsPortuguese.addressLabel, sectionsData: [
                        (
                          [
                            (AppStringsPortuguese.addressCepLabel, controller.company?.addressZipCode ?? ""),
                            (AppStringsPortuguese.addressStreetLabel, controller.company?.addressStreet ?? ""),
                            (AppStringsPortuguese.addressStateLabel, controller.company?.addressState ?? "")
                          ],
                          [
                            (AppStringsPortuguese.addressCityLabel, controller.company?.addressCity ?? ""),
                            (AppStringsPortuguese.addressNeighborhoodLabel, controller.company?.addressNeighborhood ?? ""),
                            (AppStringsPortuguese.addressCountryLabel, controller.company?.addressCountry ?? "")
                          ]
                        )
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      MultInfoCard(title: AppStringsPortuguese.bankDataLabel, sectionsData: (controller.company?.bankAccounts ?? [])
                      .map((e) =>
                        (
                          [
                            (AppStringsPortuguese.accountTypeLabel, e.bankAccountType?.name ?? ""),
                            (AppStringsPortuguese.agencyLabel, e.agencyNumber ?? ""),
                            (AppStringsPortuguese.pixKeyTypeLabel, e.pixList?.first.pixType?.name ?? "")
                          ],
                          [
                            (AppStringsPortuguese.bankLabel, e.financialInstitution?.shortName ?? ""),
                            (AppStringsPortuguese.accountLabel, e.accountNumber ?? ""),
                            (AppStringsPortuguese.pixKeyLabel, e.pixList?.first.key ?? "")
                          ]
                        )
                      ).toList()
                      )],
                  ),
                ),
        ));
  }
}
