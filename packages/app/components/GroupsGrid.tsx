import GroupCard from './GroupCard';

const GroupsGrid = () => {
  return (
    <div className="grid w-full grid-cols-2 gap-5 lg:grid-cols-3 xl:grid-cols-4">
      {[...Array(75)].map((_, i) => (
        <GroupCard key={i} />
      ))}
    </div>
  );
};
export default GroupsGrid;
