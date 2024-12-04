import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/mult_info_card/mult_info_card.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/three_info_card/three_info_card.dart';
import '../../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../widgets/single_info_card/single_info_card.dart';
import '../controller/employee_controller.dart';

class EmployeeGeneralInformationTab extends StatelessWidget {
  const EmployeeGeneralInformationTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<EmployeeController>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldTitleInfoCard(
              titleOne: AppStringsPortuguese.employeeNameLabel,
              dataOne: controller.employee?.name ?? ""),
          const SizedBox(
            height: 10,
          ),
          BoldTitleInfoCard(
              titleOne: AppStringsPortuguese.cpfLabel,
              dataOne: controller.employee?.cpf ?? ""),
          const SizedBox(
            height: 10,
          ),
          BoldTitleInfoCard(
              titleOne: AppStringsPortuguese.rgLabel,
              dataOne: controller.employee?.rg ?? ""),
          const SizedBox(
            height: 10,
          ),
          BoldTitleInfoCard(
              titleOne: AppStringsPortuguese.pisPasepLabel,
              dataOne: controller.employee?.pisPasep ?? ""),
          const SizedBox(
            height: 10,
          ),
          ThreeInfoCard(title: AppStringsPortuguese.contactLabel, info1: (
            AppStringsPortuguese.employeePhoneLabel,
            controller.employee?.phoneNumber ?? ""
          ), info2: (
            AppStringsPortuguese.employeeWhatsAppLabel,
            controller.employee?.whatsappNumber ?? ""
          ), info3: (
            AppStringsPortuguese.employeeEmailLabel,
            controller.employee?.email ?? ""
          )),
          const SizedBox(
            height: 10,
          ),
          MultInfoCard(
            title: AppStringsPortuguese.addressLabel,
            sectionsData: [
              (
                [
                  (
                    AppStringsPortuguese.addressCepLabel,
                    controller.employee?.addressZipCode ?? ""
                  ),
                  (
                    AppStringsPortuguese.addressStreetLabel,
                    controller.employee?.addressStreet ?? ""
                  ),
                  (
                    AppStringsPortuguese.addressStateLabel,
                    controller.employee?.addressState ?? ""
                  )
                ],
                [
                  (
                    AppStringsPortuguese.addressCityLabel,
                    controller.employee?.addressCity ?? ""
                  ),
                  (
                    AppStringsPortuguese.addressNeighborhoodLabel,
                    controller.employee?.addressNeighborhood ?? ""
                  ),
                  (
                    AppStringsPortuguese.addressCountryLabel,
                    controller.employee?.addressCountry ?? ""
                  )
                ]
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          MultInfoCard(
            title: AppStringsPortuguese.bankDataLabel,
            sectionsData: (controller.employee?.bankAccount ?? [])
                .map((e) => (
                      [
                        (
                          AppStringsPortuguese.accountTypeLabel,
                          e.bankAccountType?.name ?? ""
                        ),
                        (
                          AppStringsPortuguese.agencyLabel,
                          e.agencyNumber ?? ""
                        ),
                        (
                          AppStringsPortuguese.pixKeyTypeLabel,
                          e.pixList?.first.pixType?.name ?? ""
                        )
                      ],
                      [
                        (
                          AppStringsPortuguese.bankLabel,
                          e.financialInstitution?.shortName ?? ""
                        ),
                        (
                          AppStringsPortuguese.accountLabel,
                          e.accountNumber ?? ""
                        ),
                        (
                          AppStringsPortuguese.pixKeyLabel,
                          e.pixList?.first.key ?? ""
                        )
                      ]
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 25,
          ),
          MultInfoCard(
            title: AppStringsPortuguese.employeeContractLabel,
            sectionsData: [
              (
                [
                  (
                    AppStringsPortuguese.employeeAdmissionDateLabel,
                    controller.employee?.admissionDate ?? ""
                  ),
                  (AppStringsPortuguese.employeePositionLabel, controller.employee?.position ?? ""),
                  (
                    AppStringsPortuguese.employeeContractTypeLabel,
                  controller.employee?.contractType?.name ?? ""
                  ),
                  (AppStringsPortuguese.employeeBaseSalaryLabel, controller.employee?.baseSalary ?? ""),
                  (AppStringsPortuguese.employeeFiringReasonLabel, "")
                ],
                [
                  (
                    AppStringsPortuguese.employeeWorkerIdLabel,
                  controller.employee?.cpf ?? ""
                  ),
                  (AppStringsPortuguese.employeeDepartmentLabel, controller.employee?.department?.name ?? ""),
                  (AppStringsPortuguese.employeeShiftLabel, controller.employee?.workShift?.name ?? ""),
                  (AppStringsPortuguese.employeeFiringDateLabel, controller.employee?.dismissalDate ?? "")
                ]
              )
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
