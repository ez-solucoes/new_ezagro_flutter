class AppStrings {
  AppStrings._();

  static const String appTitle = 'Ez Agro';

  static const String cpfString = 'Cpf';
  static const String passwordString = 'Senha';
  static const String forgotPasswordString = 'Esqueci minha senha';
  static const String firstAccessString = 'Primeiro Acesso';
  static const String enterString = 'Entrar';
  static const String firstTypeYourCpfString = 'Primeiro digite seu CPF';
  static const String forwardString = 'Avançar';
  static const String backString = 'Voltar';
  static const String weSentTheConfirmationCodeToYourPhone = 'Enviamos em seu telefone\num código de confirmação de seu\ncadastro';
  static const String typeTheNumberBellow = 'Digite o número abaixo:';
  static const String nowTypeNewPassword = 'Agora, digite sua nova\nsenha:';
  static const String retypeYourPassword = 'Repita sua senha:';
  static const String iHaveReadAndAgreeToThe = 'Li e concordo com a ';
  static const String privacySpacingPolicy = 'Política de\nPrivacidade';
  static const String privacyPolicy = 'Política de Privacidade';
  static const String and = ' e ';
  static const String userTerms = 'Termos do Usuário';

  static const String loremIpsum = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  static const String forgotPasswordFirstStep = 'Esqueceu sua senha?\nDigite seu CPF e vamos enviar uma senha provisória em seu telefone:';

  ///Service Order Module
  //Service Order List Strings
  static const String serviceOrderTitle = 'Ordem de Serviço';
  static const String costCenterCardField = 'Centro de Custo: ';
  static const String openingDateCardField = 'Abertura: ';
  static const String closingDateCardField = 'Conclusão: ';
  static const String searchBarHint = 'Pesquisar';
  static const String dateNotInformed = 'Não informado';

  //Service Order Type Enum Strings
  static const String toBeStartedSOEnum = 'A iniciar';
  static const String onGoingSOEnum = 'Em andamento';
  static const String pausedSOEnum = 'Suspensa';
  static const String finishedOSEnum = 'Finalizada';
  static const String approvalPendingOSEnum = 'Aguardando aprovação';
  static const String approvalPendingOSWithLineBreakEnum = 'Aguardando\naprovação';
  static const String canceledOSEnum = 'Cancelada';

  //Service Order Type Backend Strings
  static const String toBeStartedSOKey = 'A_INICIAR';
  static const String onGoingSOKey = 'EM_ANDAMENTO';
  static const String pausedSOKey= 'SUSPENSA';
  static const String finishedOSKey = 'FINALIZADA';
  static const String approvalPendingOSKey = 'PENDENTE_APROVACAO';
  static const String canceledOSKey = 'CANCELADA';

  //Service Order Details
  static const String finishedServiceOrder = 'Essa Ordem de Serviço\nfoi finalizada';
  static const String saveOSButton = 'Salvar';
  static const String suspendOSButton = 'Suspender';
  static const String cancelOSButton = 'Cancelar';
  static const String finishedOSButton = 'Finalizar';
  static const String resumeOSButton = 'Retomar';

  //Create Service Order
  static const String previousButton = 'Anterior';
  static const String nextButton = 'Próximo';
  static const String activitySelectorTitle = 'Atividade:';
  static const String costCenterSelectorTitle = 'Centro de Custo:';
  static const String farmSelectorTitle = 'Fazenda:';
  static const String harvestSelectorTitle = 'Safra:';
  static const String executorSelectorTitle = 'Executores:';
  static const String machinerySelectorTitle = 'Maquinário:';
  static const String productSelectorTitle = 'Produto:';
  static const String responsiveSelectorTitle = 'Responsável:';
  static const String finalCostCenterSelector = 'Centro de Custo de Estoque de Destino:';
  static const String finalStorageSelector = 'Estoque de Destino:';
  static const String activitySelectorHint = 'Selecione uma atividade';
  static const String costCenterSelectorHint = 'Selecione um centro de custo';
  static const String farmSelectorHint = 'Selecione uma fazenda';
  static const String harvestSelectorHint = 'Selecione uma safra';
  static const String executorSelectorHint = 'Selecione um executor';
  static const String machinerySelectorHint = 'Selecione um maquinário';
  static const String productSelectorHint = 'Selecione um produto';
  static const String responsibleSelectorHint = 'Selecione um responsável';
  static const String finalCostCenterSelectorHint = 'Selecione um Centro de Custo do Estoque';
  static const String finalStorageSelectorHint = 'Selecione um estoque de destino';
  static const String selectAllButton = 'Selecionar tudo';
  static const String plotColumn = 'Talhão';
  static const String areaColumn = 'Área';
  static const String cropColumn = 'Cultura';
  static const String dateLabel = 'Data';
  static const String expectedStartDate = 'Previsão de início';
  static const String expectedFinishingDate = 'Previsão de Término';
  static const String jobValueTextFieldTitle = 'Valor do Serviço:';
  static const String notesTextFieldTitle = 'Observações:';
  static const String nameField = 'Nome:';
  static const String idField = 'ID:';
  static const String shiftField = 'Turno:';
  static const String machineryField = 'Máquina:';
  static const String machineryAliasField = 'Apelido:';
  static const String hourMeterField = 'Horímetro:';
  static const String kiloMeterField = 'Quilometragem:';
  static const String productField = 'Produto:';
  static const String quantityField = 'Quantidade:';
  static const String recommendationField = 'Recomendação:';

  ///Errors
  static const String genericErrorMessage =
      'Ocorreu um erro inesperado. Por favor, tente novamente mais tarde ou entre em contato conosco para relatar o problema.';
  static const String serverErrorMessage =
      'Ocorreu um erro no processamento da sua requisição. Por favor, tente novamente mais tarde ou entre em contato conosco para relatar o problema.';
  static const String serverErrorCausedBy =
      'Erro ao fazer a chamada de um serviço na API.';
  static const String reautenticationNeededErrorMessage =
      'Erro ao efetuar o Login.\nPor favor, verifique os dados digitados e repita a operação.';
  static const String unauthenticatedUserErrorCausedBy =
      'Usuário não autenticado.';

  ///Shared Preferences keys
  static const String tokenKey = 'Token';
  static const String idKey = 'id';
  static const String directoryKey = 'Directory';
}
