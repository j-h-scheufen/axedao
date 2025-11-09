const RippleBackground = () => {
  return (
    <div className="absolute inset-0 flex items-start justify-center z-0 pt-44 sm:pt-36">
      <div className="relative w-5/6 sm:w-2/5 aspect-square">
        <div className="absolute h-full aspect-square bg-primary opacity-10 rounded-full" />
        <div className="absolute h-full aspect-square bg-primary opacity-10 rounded-full scale-125" />
        <div className="absolute h-full aspect-square bg-primary opacity-10 rounded-full scale-150" />
      </div>
    </div>
  );
};
export default RippleBackground;
