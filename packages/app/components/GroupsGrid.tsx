import GroupCard from './GroupCard';

type Props = {};
const GroupsGrid = (props: Props) => {
  return (
    <div className="grid w-full grid-cols-2 gap-5 lg:grid-cols-3 xl:grid-cols-4">
      {[...Array(75)].map((_, i) => (
        <GroupCard key={i} />
      ))}
    </div>
  );
};
export default GroupsGrid;
