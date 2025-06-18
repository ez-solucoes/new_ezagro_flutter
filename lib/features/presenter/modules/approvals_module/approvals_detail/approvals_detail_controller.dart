import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_entities/service_order_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_usecase/approve_service_order_by_id_usecase/approve_service_order_by_id_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_usecase/cancel_service_order_by_id_usecase/cancel_service_order_by_id_usecase.dart';

import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../../domain/usecases/purchase_request_usecases/approve_purchase_request_by_id_usecases/approve_purchase_request_by_id_usecase.dart';
import '../../../../domain/usecases/purchase_request_usecases/cancel_purchase_request_by_id_usecases/cancel_purchase_request_by_id_usecase.dart';
import '../../../../domain/usecases/purchase_request_usecases/get_purchase_request_by_id_usecases/get_purchase_request_by_id_usecase.dart';
import '../../../../domain/usecases/service_order_usecase/get_service_order_by_id_usecases/get_service_order_by_id_usecase.dart';

part 'approvals_detail_controller.g.dart';

class ApprovalsDetailController = ApprovalsDetailControllerAbstract
    with _$ApprovalsDetailController;

abstract class ApprovalsDetailControllerAbstract with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isExpanded = false;

  @observable
  PurchaseRequestEntity? purchaseRequest;

  @observable
  ServiceOrderEntity? serviceOrder;

  List<List<String>> informationList = [];


  ///Purchase Request
  @action
  Future getPurchaseRequestById(int purchaseRequestId) async {
    isLoading = true;

    final getPurchaseRequestByItUsecase = Modular.get<GetPurchaseRequestByIdUsecase>();
    final result = await getPurchaseRequestByItUsecase(ArgParams(firstArgs: purchaseRequestId));
    result.fold((error) => error.friendlyMessage, (success) {
      purchaseRequest = success.data!;
      return success;
    });
    isLoading = false;
  }

  @action
  Future approvePurchaseRequestById(int purchaseRequestId) async {
    isLoading = true;

    final approvePurchaseRequestByItUsecase = Modular.get<ApprovePurchaseRequestByIdUsecase>();
    final result = await approvePurchaseRequestByItUsecase(ArgParams(firstArgs: purchaseRequestId));
    result.fold((error) => error.friendlyMessage, (success) {
      purchaseRequest = success.data!;
      return success;
    });
    isLoading = false;
  }

  @action
  Future cancelPurchaseRequestById(int purchaseRequestId) async {
    isLoading = true;

    final cancelPurchaseRequestByItUsecase = Modular.get<CancelPurchaseRequestByIdUsecase>();
    final result = await cancelPurchaseRequestByItUsecase(ArgParams(firstArgs: purchaseRequestId));
    result.fold((error) => error.friendlyMessage, (success) {
      purchaseRequest = success.data!;
      return success;
    });
    isLoading = false;
  }


  ///Service Order
  @action
  Future getServiceOrderById(int id) async {
    isLoading = true;

    final getServiceOrderByIdUsecase = Modular.get<GetServiceOrderByIdUsecase>();
    final result = await getServiceOrderByIdUsecase(ArgParams(firstArgs: id));
    result.fold((error) => error.friendlyMessage, (success) {
      serviceOrder = success as ServiceOrderEntity?;
      _buildDataLists();
      return success;
    });
    isLoading = false;
  }

  @action
  Future approveServiceOrderById(int id) async {
    isLoading = true;
    final approveServiceOrderByIdUsecase = Modular.get<ApproveServiceOrderByIdUsecase>();
    final result = await approveServiceOrderByIdUsecase(ArgParams(firstArgs: id));
    result.fold((error) => error.friendlyMessage, (success) {
      serviceOrder = success as ServiceOrderEntity?;
      return success;
    });
    isLoading = false;
  }

  @action
  Future cancelServiceOrderById(int id) async {
    isLoading = true;
    final cancelServiceOrderByIdUsecase = Modular.get<CancelServiceOrderByIdUsecase>();
    final result = await cancelServiceOrderByIdUsecase(ArgParams(firstArgs: id));
    result.fold((error) => error.friendlyMessage,
            (success) {
          serviceOrder = success as ServiceOrderEntity?;
          return success;
        });
    isLoading = false;
  }

  void _buildDataLists() {
    informationList = [
      ["Safra: ", serviceOrder?.harvestCostCenter!.name ?? ""],
      ["Talhões:", _buildPlotStringPreview(serviceOrder?.plots?.map((e) => e.id.toString()).toList() ?? [])],
      ["Área total: ", '${serviceOrder?.area} ha']
    ];
  }

  // _buildProdductDetails(int index) {
  //   if(purchaseRequest?.step?.name == 'Pedido de Compra') {
  //     return [
  //       (
  //       [
  //         ('Marca',  '${purchaseRequest!.requestItems![index].product?.registrationHolder}'),
  //         ('Vinculado à maquinário', '${purchaseRequest!.requestItems![index].machineryImplement?.nickname == null ? '' : purchaseRequest!.requestItems![index].machineryImplement!.nickname}'),
  //         ('Local de Entrega',  '${purchaseRequest!.requestItems![index].requestedQuantity}'),
  //       ],
  //       [
  //         // ('Seguemento',  (item.product?.type?.name == null ? '' : item.product!.type!.name)),
  //       ]
  //       )
  //     ];
  //
  //   }
  // }

  String _buildPlotStringPreview(List<String?> plots) {
    String plot = plots
        .where((plot) => plot != null)
        .cast<String>().join(', ');
    return plot == "" ? "Sem talhões cadastrados" : plot;
  }

}
