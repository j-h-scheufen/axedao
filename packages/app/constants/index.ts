export const titles = [
  'mestre',
  'contra-mestre',
  'mestrando',
  'professor',
  'instrutor',
  'monitor',
  'aluno-graduado',
  'aluno',
  'iniciante',
] as const;

export type TitleType = (typeof titles)[number];
