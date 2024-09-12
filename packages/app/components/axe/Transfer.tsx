'use client';

import { Button } from '@nextui-org/button';
import { Field, Form, Formik, FormikProps } from 'formik';
import { useEffect } from 'react';
import { Address, formatUnits, parseUnits } from 'viem';
import { useAccount, useWaitForTransactionReceipt } from 'wagmi';

import ENV from '@/config/environment';
import { AxeTransferForm, axeTransferForm } from '@/config/validation-schema';
import { useReadErc20BalanceOf, useWriteErc20Transfer } from '@/generated';
import { enqueueSnackbar } from 'notistack';
import { AmountInput, UserSelect } from '../forms';

const Transfer: React.FC = () => {
  const account = useAccount();

  const { data: axeBalance, refetch: updateAxeBalance } = useReadErc20BalanceOf({
    address: ENV.axeTokenAddress,
    args: [account.address as Address],
  });

  const { data: transferHash, isPending: transferPending, writeContract: transfer } = useWriteErc20Transfer();
  const {
    isSuccess: transferSuccess,
    error: transferError,
    isLoading: transferLoading,
  } = useWaitForTransactionReceipt({ hash: transferHash });

  // reactions to approve receipt outcome
  useEffect(() => {
    if (transferLoading) {
      enqueueSnackbar('Axé transfer pending. Please allow some time to confirm ...', {
        autoHideDuration: 10000,
      });
    } else if (transferSuccess) {
      enqueueSnackbar('Axé transfer confirmed!');
      updateAxeBalance();
    } else if (transferError) {
      enqueueSnackbar(`Axé transfer has failed: ${transferError.message}`);
    }
  }, [transferLoading, transferSuccess, transferError, updateAxeBalance]);

  const initialValues: AxeTransferForm = {
    amount: '',
    to: '',
  };

  // const handleConfirm = () => {};

  const handleSubmit = async ({ amount, to }: AxeTransferForm) => {
    try {
      const bigInput = parseUnits(amount, 18);
      if (true) {
        // TODO check balance one more and check for confirmation modal approval given
        transfer({ address: ENV.axeSwapTokenAddress, args: [to as Address, bigInput] });
      }
    } catch (error) {
      console.error('Error during swap.', error);
      throw error;
    }
  };

  return (
    <div className="inline-block w-full max-w-lg">
      <Formik<AxeTransferForm> initialValues={initialValues} validationSchema={axeTransferForm} onSubmit={handleSubmit}>
        {({ dirty, isValid, isSubmitting }: FormikProps<AxeTransferForm>) => (
          <Form className="flex flex-col gap-2 sm:gap-4">
            <div>Errors: {transferError?.message}</div>
            <div className="flex flex-col gap-1">
              <Field
                name="amount"
                label="Amount"
                as={AmountInput}
                validate={(value: string) => {
                  if (parseUnits(value, 18) > (axeBalance || BigInt(0))) return 'Insufficient balance';
                }}
              />
              <div className="text-default-400 justify-end px-2">
                Available: {formatUnits(axeBalance || BigInt(0), 18)} Axé
              </div>
            </div>
            <Field name="to" label="Recipient" as={UserSelect} />

            <Button
              color="primary"
              type="submit"
              isLoading={isSubmitting}
              disabled={!dirty || !isValid || transferPending}
            >
              Transfer
            </Button>
          </Form>
        )}
      </Formik>
    </div>
  );
};

export default Transfer;
