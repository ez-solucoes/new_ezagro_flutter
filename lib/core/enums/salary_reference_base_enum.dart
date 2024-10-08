//[ VALOR_LIVRE, PORCENTAGEM_DO_SALARIO_BASE, PORCENTAGEM_DO_SALARIO_MINIMO, PORCENTAGEM_DA_COMPOSICAO ]

enum SalaryReferenceBaseEnum {
  valorLivre,
  porcentagemDoSalarioBase,
  porcentagemDoSalarioMinimo,
  porcentagemDaComposicao,
}

plantingTypeEnum(String salaryReferenceBase) {
  switch (salaryReferenceBase) {
    case 'VALOR_LIVRE': return SalaryReferenceBaseEnum.valorLivre;
    case 'PORCENTAGEM_DO_SALARIO_BASE': return SalaryReferenceBaseEnum.porcentagemDoSalarioBase;
    case 'PORCENTAGEM_DO_SALARIO_MINIMO': return SalaryReferenceBaseEnum.porcentagemDoSalarioMinimo;
    case 'PORCENTAGEM_DA_COMPOSICAO': return SalaryReferenceBaseEnum.porcentagemDaComposicao;
  }
}

plantingTypeString(type) {
  switch (type) {
    case SalaryReferenceBaseEnum.valorLivre: return 'VALOR_LIVRE';
    case SalaryReferenceBaseEnum.porcentagemDoSalarioBase: return 'PORCENTAGEM_DO_SALARIO_BASE';
    case SalaryReferenceBaseEnum.porcentagemDoSalarioMinimo: return 'PORCENTAGEM_DO_SALARIO_MINIMO';
    case SalaryReferenceBaseEnum.porcentagemDaComposicao: return 'PORCENTAGEM_DA_COMPOSICAO';
    default:
      return '';
  }
}