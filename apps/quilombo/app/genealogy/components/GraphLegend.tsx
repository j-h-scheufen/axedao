'use client';

import { Card, CardBody } from '@heroui/react';

import { NODE_COLORS } from '../types';

interface LegendItem {
  label: string;
  color: string;
}

const NODE_LEGEND: { category: string; items: LegendItem[] }[] = [
  {
    category: 'Person Titles',
    items: [
      { label: 'Mestre', color: NODE_COLORS.person.mestre },
      { label: 'Contra-Mestre', color: NODE_COLORS.person['contra-mestre'] },
      { label: 'Professor', color: NODE_COLORS.person.professor },
      { label: 'Instrutor', color: NODE_COLORS.person.instrutor },
      { label: 'Graduado', color: NODE_COLORS.person.graduado },
      { label: 'Aluno', color: NODE_COLORS.person.aluno },
    ],
  },
  {
    category: 'Group Styles',
    items: [
      { label: 'Angola', color: NODE_COLORS.group.angola },
      { label: 'Regional', color: NODE_COLORS.group.regional },
      { label: 'Contemporânea', color: NODE_COLORS.group.contemporanea },
      { label: 'Mixed', color: NODE_COLORS.group.mixed },
    ],
  },
];

function ColorDot({ color }: { color: string }) {
  return <span className="inline-block h-3 w-3 shrink-0 rounded-full" style={{ backgroundColor: color }} />;
}

export function GraphLegend() {
  return (
    <Card className="absolute bottom-4 left-4 z-10 max-w-xs">
      <CardBody className="gap-3 p-3">
        <h3 className="text-small font-semibold">Legend</h3>
        {NODE_LEGEND.map((group) => (
          <div key={group.category}>
            <p className="mb-1 text-tiny font-medium text-default-500">{group.category}</p>
            <div className="grid grid-cols-2 gap-x-3 gap-y-1">
              {group.items.map((item) => (
                <div key={item.label} className="flex items-center gap-1.5">
                  <ColorDot color={item.color} />
                  <span className="text-tiny">{item.label}</span>
                </div>
              ))}
            </div>
          </div>
        ))}
        <div>
          <p className="mb-1 text-tiny font-medium text-default-500">Node Shapes</p>
          <div className="flex gap-3 text-tiny">
            <span>&#x25CF; Person</span>
            <span>&#x2B21; Group</span>
          </div>
        </div>
      </CardBody>
    </Card>
  );
}

export default GraphLegend;
