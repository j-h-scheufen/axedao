import { Badge, BadgeProps } from "@heroui/badge";
import { Tooltip } from "@heroui/tooltip";
import { CircleCheckIcon } from 'lucide-react';

type Props = { verified: boolean } & BadgeProps;

const VerificationBadge = ({ verified, children, ...props }: Props) => {
  if (!verified) return children;
  return (
    <Badge
      content={
        <Tooltip content="Verified Group">
          <CircleCheckIcon className="[&>circle]:fill-primary stroke-default-100" />
        </Tooltip>
      }
      placement="top-left"
      isOneChar
      color="primary"
      tooltip="Verified Group"
      {...props}
    >
      {children}
    </Badge>
  );
};

export default VerificationBadge;
