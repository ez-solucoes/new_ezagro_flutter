//[ A_INICIAR, EM_ANDAMENTO, SUSPENSA, FINALIZADA, PENDENTE_APROVACAO, CANCELADA ]

enum FieldServiceOrderStatusEnum {
  aIniciar,
  emAndamento,
  suspensa,
  finalizada,
  pendenteAprovacao,
  cancelada,
}

fieldServiceOrderStatusEnum(String fieldServiceOrderStatus) {
  switch (fieldServiceOrderStatus) {
    case 'A_INICIAR':
      return FieldServiceOrderStatusEnum.aIniciar;
    case 'EM_ANDAMENTO':
      return FieldServiceOrderStatusEnum.emAndamento;
    case 'SUSPENSA':
      return FieldServiceOrderStatusEnum.suspensa;
    case 'FINALIZADA':
      return FieldServiceOrderStatusEnum.finalizada;
    case 'PENDENTE_APROVACAO':
      return FieldServiceOrderStatusEnum.pendenteAprovacao;
    case 'CANCELADA':
      return FieldServiceOrderStatusEnum.cancelada;
  }
}

fieldServiceOrderStatusString(type) {
  switch (type) {
    case FieldServiceOrderStatusEnum.aIniciar:
      return 'A_INICIAR';
    case FieldServiceOrderStatusEnum.emAndamento:
      return 'EM_ANDAMENTO';
    case FieldServiceOrderStatusEnum.suspensa:
      return 'SUSPENSA';
    case FieldServiceOrderStatusEnum.finalizada:
      return 'FINALIZADA';
    case FieldServiceOrderStatusEnum.pendenteAprovacao:
      return 'PENDENTE_APROVACAO';
    case FieldServiceOrderStatusEnum.cancelada:
      return 'CANCELADA';
    default:
      return '';
  }
}