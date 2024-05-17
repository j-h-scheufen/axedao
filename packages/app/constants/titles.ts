const titles = [
  'None',
  'Mestre',
  'Contra-Mestre',
  'Mestrando',
  'Professor',
  'Instructor',
  'Monitor',
  'Aluno Graduado',
  'Aluno',
  'Iniciante',
] as const;

export type TitleType = (typeof titles)[number];

export default titles;
