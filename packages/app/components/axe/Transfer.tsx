'use client';

import { Button } from '@nextui-org/button';
import { Field, Form, Formik, FormikProps } from 'formik';
import { Address, formatUnits, parseUnits } from 'viem';
import { useAccount } from 'wagmi';

import ENV from '@/config/environment';
import { AxeTransferForm, axeTransferForm } from '@/config/validation-schema';
import { useReadErc20BalanceOf } from '@/generated';
import { AmountInput, UserSelect } from '../forms';

const Transfer: React.FC = () => {
  const account = useAccount();

  const { data: axeBalance } = useReadErc20BalanceOf({
    address: ENV.axeTokenAddress,
    args: [account.address as Address],
  });

  // const update = useCallback(async () => {
  //   return Promise.all([updateAxeBalance()]);
  // }, [updateAxeBalance]);

  const initialValues: AxeTransferForm = {
    amount: '',
    to: '',
  };

  // const handleConfirm = () => {};

  const handleSubmit = async ({ amount, to }: AxeTransferForm) => {
    console.log('Submit');
    const bigAmount = parseUnits(amount, 18);
    console.log(`Transfering ${bigAmount} to ${to}`);
    try {
    } catch (error) {
      console.error('Error during transfer.', error);
      throw error;
    }
  };

  return (
    <div className="inline-block w-full max-w-lg">
      <Formik<AxeTransferForm> initialValues={initialValues} validationSchema={axeTransferForm} onSubmit={handleSubmit}>
        {({ dirty, isValid, isSubmitting, errors }: FormikProps<AxeTransferForm>) => (
          <Form className="flex flex-col gap-2 sm:gap-4">
            <div>
              Errors: {JSON.stringify(errors)}, Valid {isValid ? 'Yes' : 'No'}
            </div>
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

            <Button color="primary" type="submit" isLoading={isSubmitting} disabled={!dirty || !isValid}>
              Review Transfer
            </Button>
          </Form>
        )}
      </Formik>
    </div>
  );
};

export default Transfer;
