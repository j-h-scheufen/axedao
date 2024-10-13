import { Input } from '@nextui-org/input';
import { Radio, RadioGroup, RadioProps } from '@nextui-org/radio';
import { FieldProps, useField } from 'formik';
import { useState } from 'react';

import { isUUID } from '@/utils';
import UserSelect from './UserSelect';

const FounderRadioBox = (props: RadioProps) => {
  const { children, ...otherProps } = props;

  return <Radio {...otherProps}>{children}</Radio>;
};

const FounderField = (props: FieldProps['field']) => {
  const [field, , form] = useField(props);
  const isSelectedUuid = field.value && isUUID(field.value);
  const [selectedRadio, setSelectedRadio] = useState<string>(isSelectedUuid ? 'user' : 'name');

  const handleRadioChange = (value: string) => {
    // Delete the form value when switching over from the UserSelect to Input to avoid showing the user's wallet address
    if (value === 'name' && isSelectedUuid) {
      form.setValue('');
    }
    setSelectedRadio(value);
  };

  return (
    <div className="flex flex-col gap-2 w-full">
      <h4 className="">Who is the founder of this group?</h4>
      <RadioGroup value={selectedRadio} onValueChange={handleRadioChange} orientation="horizontal">
        <FounderRadioBox value="name">Type the name:</FounderRadioBox>
        <FounderRadioBox value="user">Select a user:</FounderRadioBox>
      </RadioGroup>
      {selectedRadio === 'name' && (
        <Input {...field} className="mb-3" classNames={{ inputWrapper: '!min-h-12' }} {...props} value={field.value} />
      )}
      {selectedRadio === 'user' && <UserSelect {...field} {...props} disableCurrentUser={false} />}
    </div>
  );
};
export default FounderField;
