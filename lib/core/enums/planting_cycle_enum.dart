//SUPER_EARLY, EARLY, MEDIUM, LATE

enum PlantingCycleEnum {
  superEarly,
  early,
  medium,
  late,
}

plantingCycleEnum(String plantingCycle) {
  switch (plantingCycle) {
    case 'SUPER_EARLY':
      return PlantingCycleEnum.superEarly;
    case 'EARLY':
      return PlantingCycleEnum.early;
    case 'MEDIUM':
      return PlantingCycleEnum.medium;
    case 'LATE':
      return PlantingCycleEnum.late;
  }
}

plantingCycleString(type) {
  switch (type) {
    case PlantingCycleEnum.superEarly:
      return 'SUPER_EARLY';
    case PlantingCycleEnum.early:
      return 'EARLY';
    case PlantingCycleEnum.medium:
      return 'MEDIUM';
    case PlantingCycleEnum.late:
      return 'LATE';
    default:
      return '';
  }
}
