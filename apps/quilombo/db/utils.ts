import type { TableConfig } from 'drizzle-orm';
import type { PgTableWithColumns } from 'drizzle-orm/pg-core';

export const getFields = <T extends TableConfig>(table: PgTableWithColumns<T>) => {
  return Object.keys(table).reduce((acc, key) => {
    return Object.assign(acc, { [key]: table[key as keyof PgTableWithColumns<T>] });
  }, {});
};
