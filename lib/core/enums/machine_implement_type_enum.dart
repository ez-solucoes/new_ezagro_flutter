// [ MAQUINARIO, IMPLEMENTO ]

enum MachineImplementTypeEnum {
  maquinario,
  implemento,
}

machineImplementTypeEnum(String machineImplementType) {
  switch (machineImplementType) {
    case 'MAQUINARIO':
      return MachineImplementTypeEnum.maquinario;
    case 'IMPLEMENTO':
      return MachineImplementTypeEnum.implemento;
  }
}

machineImplementTypeString(type) {
  switch (type) {
    case MachineImplementTypeEnum.maquinario:
      return 'MAQUINARIO';
    case MachineImplementTypeEnum.implemento:
      return 'IMPLEMENTO';
    default:
      return '';
  }
}
