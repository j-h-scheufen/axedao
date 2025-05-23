const RippleBackground = () => {
  return (
    <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 h-5/6 aspect-square z-0">
      <div className="absolute h-full aspect-square bg-primary opacity-10 rounded-full" />
      <div className="absolute h-full aspect-square bg-primary opacity-10 rounded-full scale-125" />
      <div className="absolute h-full aspect-square bg-primary opacity-10 rounded-full scale-150" />
    </div>
  );
};
export default RippleBackground;
