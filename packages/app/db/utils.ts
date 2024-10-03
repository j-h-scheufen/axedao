import { TableConfig } from 'drizzle-orm';
import { PgTableWithColumns } from 'drizzle-orm/pg-core';

export const getFields = <T extends TableConfig>(table: PgTableWithColumns<T>) => {
  return Object.keys(table).reduce((acc, key) => {
    return { ...acc, [key]: table[key as keyof PgTableWithColumns<T>] };
  }, {});
};
