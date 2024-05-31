'use client';

import { forwardRef, useState } from 'react';
import { Input, InputProps } from '@nextui-org/input';
import { ForwardedRef } from 'react';
import { EyeIcon, EyeOffIcon } from 'lucide-react';

type Props = Omit<InputProps, 'endContent' | 'type'>;
const PasswordInput = (props: Props, ref: ForwardedRef<HTMLInputElement>) => {
  const [passwordIsVisible, setPasswordIsVisible] = useState(false);
  const togglePasswordVisibility = () => setPasswordIsVisible(!passwordIsVisible);

  return (
    <Input
      ref={ref}
      {...props}
      type={passwordIsVisible ? 'text' : 'password'}
      endContent={
        <button className="focus:outline-none" type="button" onClick={togglePasswordVisibility}>
          {passwordIsVisible ? (
            <EyeOffIcon strokeWidth={1.25} className="pointer-events-none h-5 w-5 text-2xl text-default-400" />
          ) : (
            <EyeIcon strokeWidth={1.25} className="pointer-events-none h-5 w-5 text-2xl text-default-400" />
          )}
        </button>
      }
    />
  );
};
export default forwardRef(PasswordInput);
