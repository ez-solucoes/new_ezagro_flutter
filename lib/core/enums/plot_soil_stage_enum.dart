//[ DEFAULT, FALLOW, PLANTING_YEAR_AND_HALF, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C ]

enum PlotSoilStageEnum {
  // default,  -> enum default commented because this is a Dart reserved word and is not received by API
  fallow,
  plantingYearAndHalf,
  c1,
  c2,
  c3,
  c4,
  c5,
  c6,
  c7,
  c8,
  c9,
  c10,
  c11,
  c12,
  c13,
  c14,
  c15,
  c,
}

plotSoilStageEnum(String plotSoilStage) {
  switch (plotSoilStage) {
  // case 'DEFAULT':
  //   return PlotSoilStageEnum.default;
    case 'FALLOW':
      return PlotSoilStageEnum.fallow;
    case 'PLANTING_YEAR_AND_HALF':
      return PlotSoilStageEnum.plantingYearAndHalf;
    case 'C1':
      return PlotSoilStageEnum.c1;
    case 'C2':
      return PlotSoilStageEnum.c2;
    case 'C3':
      return PlotSoilStageEnum.c3;
    case 'C4':
      return PlotSoilStageEnum.c4;
    case 'C5':
      return PlotSoilStageEnum.c5;
    case 'C6':
      return PlotSoilStageEnum.c6;
    case 'C7':
      return PlotSoilStageEnum.c7;
    case 'C8':
      return PlotSoilStageEnum.c8;
    case 'C9':
      return PlotSoilStageEnum.c9;
    case 'C10':
      return PlotSoilStageEnum.c10;
    case 'C11':
      return PlotSoilStageEnum.c11;
    case 'C12':
      return PlotSoilStageEnum.c12;
    case 'C13':
      return PlotSoilStageEnum.c13;
    case 'C14':
      return PlotSoilStageEnum.c14;
    case 'C15':
      return PlotSoilStageEnum.c15;
    case 'C':
      return PlotSoilStageEnum.c;
  }
}

plotSoilStageString(type) {
  switch (type) {
  // case PlotSoilStageEnum.default:
  //   return 'DEFAULT';
    case PlotSoilStageEnum.fallow:
      return 'FALLOW';
    case PlotSoilStageEnum.plantingYearAndHalf:
      return 'PLANTING_YEAR_AND_HALF';
    case PlotSoilStageEnum.c1:
      return 'C1';
    case PlotSoilStageEnum.c2:
      return 'C2';
    case PlotSoilStageEnum.c3:
      return 'C3';
    case PlotSoilStageEnum.c4:
      return 'C4';
    case PlotSoilStageEnum.c5:
      return 'C5';
    case PlotSoilStageEnum.c6:
      return 'C6';
    case PlotSoilStageEnum.c7:
      return 'C7';
    case PlotSoilStageEnum.c8:
      return 'C8';
    case PlotSoilStageEnum.c9:
      return 'C9';
    case PlotSoilStageEnum.c10:
      return 'C10';
    case PlotSoilStageEnum.c11:
      return 'C11';
    case PlotSoilStageEnum.c12:
      return 'C12';
    case PlotSoilStageEnum.c13:
      return 'C13';
    case PlotSoilStageEnum.c14:
      return 'C14';
    case PlotSoilStageEnum.c15:
      return 'C15';
    case PlotSoilStageEnum.c:
      return 'C';
    default:
      return '';
  }
}