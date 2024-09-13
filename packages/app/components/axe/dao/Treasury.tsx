'use client';

import { Card, CardBody } from '@nextui-org/card';
import { Table, TableBody, TableCell, TableColumn, TableHeader, TableRow } from '@nextui-org/table';

import ENV from '@/config/environment';
import { useReadErc20BalanceOf } from '@/generated';
import { formatUnits } from 'viem';

const Treasury: React.FC = () => {
  const { data: axeBalance } = useReadErc20BalanceOf({
    address: ENV.axeTokenAddress,
    args: [ENV.axeTreasuryAddress],
  });

  const { data: usdBalance } = useReadErc20BalanceOf({
    address: ENV.axeSwapTokenAddress,
    args: [ENV.axeTreasuryAddress],
  });

  return (
    <Card className="inline-block w-full">
      <CardBody>
        <Table aria-label="Treasury Assets" removeWrapper>
          <TableHeader>
            <TableColumn>Asset</TableColumn>
            <TableColumn>Amount</TableColumn>
          </TableHeader>
          <TableBody>
            <TableRow key="axe">
              <TableCell>Axé</TableCell>
              <TableCell>{formatUnits(axeBalance || BigInt(0), 18)}</TableCell>
            </TableRow>
            <TableRow key="usd">
              <TableCell>USD</TableCell>
              <TableCell>{formatUnits(usdBalance || BigInt(0), 18)}</TableCell>
            </TableRow>
          </TableBody>
        </Table>
      </CardBody>
    </Card>
  );
};

export default Treasury;
