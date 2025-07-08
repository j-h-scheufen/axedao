import GroupLocationsMap from '@/components/geocode/GroupLocationsMap';

export default function GlobalMapPage() {
  return (
    <div className="container mx-auto">
      <div className="mb-6">
        <h1 className="text-3xl font-bold text-gray-900">Global Capoeira Groups Map</h1>
        <p className="text-gray-600 mt-2">Explore Capoeira groups around the world</p>
      </div>

      <div className="rounded-lg shadow-lg overflow-hidden">
        <GroupLocationsMap />
      </div>
    </div>
  );
}
