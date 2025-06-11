// [ CPF, CEP, CNPJ, BRL, USD ]

enum MaskTypeEnum {
  cpf,
  cnpj,
  cep,
  brl,
  usd,
}

maskType(String maskType) {
  switch (maskType) {
    case 'CPF':
      return MaskTypeEnum.cpf;
    case 'CNPJ':
      return MaskTypeEnum.cnpj;
    case 'CEP':
      return MaskTypeEnum.cep;
    case 'BRL':
      return MaskTypeEnum.brl;
    case 'USD':
      return MaskTypeEnum.usd;
  }
}

maskTypeString(type) {
  switch (type) {
    case MaskTypeEnum.cpf:
      return 'CPF';
    case MaskTypeEnum.cnpj:
      return 'CNPJ';
    case MaskTypeEnum.cep:
      return 'CEP';
    case MaskTypeEnum.brl:
      return 'BRL';
    case MaskTypeEnum.usd:
      return 'USD';
    default:
      return '';
  }
}

maskString(type) {
  switch (type) {
    case MaskTypeEnum.cpf:
      return '000.000.000-00';
    case MaskTypeEnum.cnpj:
      return '00.000.000/0000-00';
    case MaskTypeEnum.cep:
      return '00000-000';
    default:
      return '';
  }
}