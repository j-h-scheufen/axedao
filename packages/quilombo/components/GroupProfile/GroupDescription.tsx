import SubsectionHeading from '@/components/SubsectionHeading';

type Props = { description: string | null | undefined };

const GroupDescription = ({ description }: Props) => {
  return (
    <>
      <SubsectionHeading className="mt-0 text-default-400 mb-2">Description</SubsectionHeading>
      {!!description && <p className="text-center text-small text-default-500 xs:text-left mb-5">{description}</p>}
    </>
  );
};
export default GroupDescription;
