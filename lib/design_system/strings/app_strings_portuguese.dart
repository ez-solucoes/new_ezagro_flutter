class AppStringsPortuguese {
  AppStringsPortuguese._();

  static const String appTitle = 'Ez Agro';
  static const String appCapitalTile = 'EZ AGRO';

  static const String cpfString = 'Cpf';
  static const String passwordString = 'Senha';
  static const String forgotPasswordString = 'Esqueci minha senha';
  static const String firstAccessString = 'Primeiro Acesso';
  static const String enterString = 'Entrar';
  static const String firstTypeYourCpfString = 'Primeiro digite seu CPF';
  static const String forwardString = 'Avançar';
  static const String backString = 'Voltar';
  static const String backToLoginString = 'Voltar ao Login';
  static const String weSentTheConfirmationCodeToYourPhone =
      'Enviamos em seu telefone\num código de confirmação de seu\ncadastro';
  static const String typeTheNumberBellow = 'Digite o número abaixo:';
  static const String nowTypeNewPassword = 'Agora, digite sua nova\nsenha:';
  static const String retypeYourPassword = 'Repita sua senha:';
  static const String iHaveReadAndAgreeToThe = 'Li e concordo com a ';
  static const String privacySpacingPolicy = 'Política de\nPrivacidade';
  static const String privacyPolicy = 'Política de Privacidade';
  static const String and = ' e ';
  static const String userTerms = 'Termos do Usuário';

  static const String loremIpsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';


  ///Authentication Module
  static const String forgotPasswordCpf =
      'Esqueceu sua senha?\nDigite seu CPF e vamos enviar uma senha provisória em seu telefone:';
  static const String tempPassword =
      'Agora digite abaixo a senha provisória que enviamos para seu telefone:';
  static const String createNewPasswordString = 'Crie sua nova senha:';
  static const String repeatYourNewPasswordString = 'Repita sua nova senha:';
  static const String recoverPasswordSuccessString =
      'Pronto!\nSua nova senha foi criada\nAgora você pode voltar para a área de Login e acessar novamente.';

  //Auth error alert
  static const String authErrorAlertString = 'Usuário ou senha incorretos:';


  ///Service Order Module
  //Service Order List Strings
  static const String serviceOrderTitle = 'Ordem de Serviço';
  static const String pluralServicesOrder = 'Ordens de Serviços';
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
  static const String approvalPendingOSWithLineBreakEnum =
      'Aguardando\naprovação';
  static const String canceledOSEnum = 'Cancelada';

  //Service Order Type Backend Strings
  static const String toBeStartedSOKey = 'A_INICIAR';
  static const String onGoingSOKey = 'EM_ANDAMENTO';
  static const String pausedSOKey = 'SUSPENSA';
  static const String finishedOSKey = 'FINALIZADA';
  static const String approvalPendingOSKey = 'PENDENTE_APROVACAO';
  static const String canceledOSKey = 'CANCELADA';

  //Service Order Details
  static const String finishedServiceOrder =
      'Essa Ordem de Serviço\nfoi finalizada';
  static const String saveOSButton = 'Salvar';
  static const String suspendOSButton = 'Suspender';
  static const String cancelOSButton = 'Cancelar';
  static const String finishedOSButton = 'Finalizar';
  static const String resumeOSButton = 'Retomar';
  static const String activityLabel = 'Atividade';
  static const String openingDateLabel = 'Abertura:';
  static const String responsibleLabel = 'Responsável';
  static const String cropLabel = 'Cultura:';
  static const String varietyLabel = 'Variedade';
  static const String technologyLabel = 'Tecnologia';
  static const String executorsLabel = 'Executores';
  static const String machineryLabel = 'Maquinário';
  static const String pestsLabel = 'Praga';
  static const String storageLabel = 'Estoque';
  static const String estimatedStartDateLabel = 'Previsão de início';
  static const String estimatedEndDateLabel = 'Previsão de término';
  static const String servicePriceLabel = 'Valor do Serviço';
  static const String notesLabel = 'Observações';
  static const String newPlanting = ' - Novo Plantio';

  //Create Service Order
  static const String createServiceOrder = 'Criar Ordem de Serviço';
  static const String previousButton = 'Anterior';
  static const String nextButton = 'Próximo';
  static const String activitySelectorTitle = 'Atividade:';
  static const String costCenterSelectorTitle = 'Centro de Custo:';
  static const String farmSelectorTitle = 'Fazenda:';
  static const String harvestSelectorTitle = 'Safra:';
  static const String pestsSelectorTitle = 'Pragas:';
  static const String executorSelectorTitle = 'Executores:';
  static const String machinerySelectorTitle = 'Maquinário:';
  static const String productSelectorTitle = 'Produto:';
  static const String responsibleSelectorTitle = 'Responsável:';
  static const String finalCostCenterSelector =
      'Centro de Custo de Estoque de Destino:';
  static const String finalStorageSelector = 'Estoque de Destino:';
  static const String activitySelectorHint = 'Selecione uma atividade';
  static const String costCenterSelectorHint = 'Selecione um centro de custo';
  static const String farmSelectorHint = 'Selecione uma fazenda';
  static const String harvestSelectorHint = 'Selecione uma safra';
  static const String pestSelectorHint = 'Selecione uma praga';
  static const String executorSelectorHint = 'Selecione um executor';
  static const String machinerySelectorHint = 'Selecione um maquinário';
  static const String productSelectorHint = 'Selecione um produto';
  static const String responsibleSelectorHint = 'Selecione um responsável';
  static const String finalCostCenterSelectorHint =
      'Selecione um Centro de Custo do Estoque';
  static const String finalStorageSelectorHint =
      'Selecione um estoque de destino';
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
  static const String scientificNameField = 'Nome Científico:';
  static const String shiftField = 'Turno:';
  static const String machineryField = 'Máquina:';
  static const String machineryAliasField = 'Apelido:';
  static const String hourMeterField = 'Horímetro:';
  static const String kiloMeterField = 'Quilometragem:';
  static const String productField = 'Produto:';
  static const String quantityField = 'Quantidade:';
  static const String recommendationField = 'Recomendação:';

  ///Register Module
  static const String pluralCompanyTitle = "Empresas";
  static const String singularCompanyTitle = "Empresa";
  static const String hashtagSymbol = "#";
  static const String companyNameColumn = "Nome";
  static const String companyIdentifierColumn = "CNPJ";
  static const String pluralContractTitle = "Contratos";
  static const String singularContractTitle = "Contrato";
  static const String contractNameColumn = "Contrato";
  static const String contractTypeColumn = "Tipo";
  static const String contractLabel = "Contrato:";
  static const String typeLabel = "Tipo:";
  static const String externalCodeLabel = "Códgio Externo:";
  static const String costCenterLabel = "Centro de Custo:";
  static const String startingDateLabel = "Data de Início:";
  static const String endingDateLabel = "Data do Fim:";
  static const String ruralProducerLabel = "Produtor Rural:";
  static const String farmLabel = "Fazenda:";
  static const String credorCompanyLabel = "Empresa Credora:";
  static const String globalValueLabel = "Valor Global:";
  static const String itemsSectionTitle = "Itens";
  static const String itemColumn = "Item";
  static const String valueColumn = "Valor";
  static const String pluralEmployeeTitle = "Funcionários";
  static const String singularEmployeeTitle = "Funcionário";
  static const String employeesNameColumn = "Nome";
  static const String positionColumn = "Cargo";
  static const String generalInformationTab = "Informações Gerais";
  static const String additionalInformationTab = "Informações Adicionais";
  static const String employeeNameLabel = "Nome:";
  static const String cpfLabel = "CPF:";
  static const String rgLabel = "RG";
  static const String pisPasepLabel  = "PIS/PASEP:";
  static const String contactLabel = "Contato:";
  static const String addressLabel = "Endereço:";
  static const String bankDataLabel = "Dados Bancários:";
  static const String employeeContractLabel = "Contrato:";
  static const String employeePhoneLabel = "Telefone:";
  static const String employeeWhatsAppLabel = "What'sApp:";
  static const String employeeEmailLabel = "E-mail:";
  static const String employeeAccountTypeLabel = "Tipo de conta";
  static const String employeeBankLabel = "Banco:";
  static const String employeeAgencyLabel = "Agência:";
  static const String employeeAccountLabel = "Conta:";
  static const String employeePixKeyTypeLabel = "Tipo de Chave Pix:";
  static const String employeePixKeyLabel = "Chave Pix:";
  static const String employeeAdmissionDateLabel = "Data de Admissão:";
  static const String employeeWorkerIdLabel = "Número da Carteira de trabalho:";
  static const String employeePositionLabel = "Cargo:";
  static const String employeeDepartmentLabel = "Departamento:";
  static const String employeeContractTypeLabel = "Tipo de contrato:";
  static const String employeeShiftLabel = "Turno:";
  static const String employeeBaseSalaryLabel = "Salário Base:";
  static const String employeeFiringDateLabel = "Data de Demissão";
  static const String employeeFiringReasonLabel = "Motivo da Demissão";
  static const String employeeContactorLabel = "Contatante:";
  static const String employeeSalaryCompositionLabel = "Composição Salarial:";
  static const String employeeCostCenterLabel = "Centro de Custo:";
  static const String employeeFarmLabel = "Fazenda:";
  static const String employeeRuralProducerLabel = "Produtor Rural:";
  static const String employeeCompanyLabel = "Empresa:";
  static const String employeeCompositionLabel = "Composição:";
  static const String employeeReferenceLabel = "Referência:";
  static const String employeeReferenceBaseLabel = "Base de Referência:";
  static const String employeeCeiLabel = "CEI:";
  static const String employeeInsuranceCodeLabel = "Código de Seguro:";
  static const String employeeUnionCodeLabel = "Código Sindical:";
  static const String employeeHealthCareLabel = "Plano de Saúde:";
  static const String employeeDependentColumn = "Dependentes";
  static const String employeeRelationColumn = "Relação";
  static const String employeeBirthdayColumn = "Nascimento";
  static const String employeeAttachmentsLabel = "Anexos:";

  static const String addressCepLabel = "CEP:";
  static const String addressCityLabel = "Cidade:";
  static const String addressStreetLabel = "Logradouro";
  static const String addressNeighborhoodLabel = "Bairro:";
  static const String addressStateLabel = "Estado:";
  static const String addressCountryLabel = "País:";

  static const String pluralFarmTitle = "Fazendas";
  static const String farmColumnName = "Fazenda";
  static const String farmCostCenterColumn = "Centro de Custo";
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
  static const String storageTypeSecure = 'Secure Storage';
  static const String storageTypeLocal = 'Local Storage';
  static const String tokenKey = 'Token';
  static const String nameKey = 'Name';
  static const String idKey = 'id';
  static const String directoryKey = 'Directory';

  ///SnackBar
  static const String successSnackBarString = '';
  static const String errorSnackBarString = '';
}
