import 'package:equatable/equatable.dart';

class ItemsEntity extends Equatable {
  final int productId;
  final String? productName;
  final int? agriculturalInputId;
  final int? machineryImplementId;
  final String? serviceName;
  final String? description;
  final int requestedQuantity;
  final List<String>? attachmentUrls;

  const ItemsEntity({
    required this.productId,
    this.productName,
    this.agriculturalInputId,
    this.machineryImplementId,
    this.serviceName,
    this.description,
    required this.requestedQuantity,
    this.attachmentUrls,
  });

  ItemsEntity copyWith({
    int? productId,
    String? productName,
    int? agriculturalInputId,
    int? machineryImplementId,
    String? serviceName,
    String? description,
    int? requestedQuantity,
    List<String>? attachmentUrls,
  }) {
    return ItemsEntity(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      agriculturalInputId: agriculturalInputId ?? this.agriculturalInputId,
      machineryImplementId: machineryImplementId ?? this.machineryImplementId,
      serviceName: serviceName ?? this.serviceName,
      description: description ?? this.description,
      requestedQuantity: requestedQuantity ?? this.requestedQuantity,
      attachmentUrls: attachmentUrls ?? this.attachmentUrls,
    );
  }

  @override
  List<Object?> get props => [
    productId,
    productName,
    agriculturalInputId,
    machineryImplementId,
    serviceName,
    description,
    requestedQuantity,
    attachmentUrls,
  ];
}