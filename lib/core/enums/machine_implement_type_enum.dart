// [ MACHINE, IMPLEMENT ]

enum MachineImplementTypeEnum {
  machine,
  implement,
}

machineImplementTypeEnum(String machineImplementType) {
  switch (machineImplementType) {
    case 'MACHINE':
      return MachineImplementTypeEnum.machine;
    case 'IMPLEMENT':
      return MachineImplementTypeEnum.implement;
  }
}

machineImplementTypeString(type) {
  switch (type) {
    case MachineImplementTypeEnum.machine:
      return 'MACHINE';
    case MachineImplementTypeEnum.implement:
      return 'IMPLEMENT';
    default:
      return '';
  }
}
