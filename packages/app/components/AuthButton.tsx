import useSilk from '@/hooks/useSilk';
import { Button } from '@nextui-org/button';

const AuthButton = () => {
  const silk = useSilk();
  return <Button onPress={silk.login}>Connect</Button>;
};
export default AuthButton;
