'use client';

import { Card, CardBody, Skeleton } from '@heroui/react';
import { Users, CheckCircle, UsersRound, Calendar } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import axios from 'axios';

interface PublicStats {
  activeUsers: number;
  verifiedGroups: number;
  unverifiedGroups: number;
  upcomingEvents: number;
}

const fetchStats = async (): Promise<PublicStats> => {
  const response = await axios.get('/api/stats');
  return response.data;
};

interface StatCardProps {
  icon: React.ReactNode;
  label: string;
  value: number;
}

const StatCard = ({ icon, label, value }: StatCardProps) => {
  return (
    <Card className="shadow-medium">
      <CardBody className="flex flex-row items-start gap-3 p-4">
        <div className="text-primary-400 dark:text-primary-500">{icon}</div>
        <div className="flex flex-col gap-0.5">
          <span className="text-2xl font-bold text-default-900">{value.toLocaleString()}</span>
          <span className="text-sm text-default-500">{label}</span>
        </div>
      </CardBody>
    </Card>
  );
};

const StatCardSkeleton = () => {
  return (
    <Card className="shadow-medium">
      <CardBody className="flex flex-row items-start gap-3 p-4">
        <Skeleton className="w-6 h-6 rounded-lg" />
        <div className="flex flex-col gap-2 flex-1">
          <Skeleton className="h-7 w-16 rounded-lg" />
          <Skeleton className="h-4 w-24 rounded-lg" />
        </div>
      </CardBody>
    </Card>
  );
};

/**
 * StatisticsWidget displays public platform statistics in a grid of cards.
 * Fetches data from /api/stats with automatic caching and refetching.
 */
const StatisticsWidget = () => {
  const {
    data: stats,
    isLoading,
    isError,
  } = useQuery({
    queryKey: ['publicStats'],
    queryFn: fetchStats,
    staleTime: 5 * 60 * 1000, // Consider data fresh for 5 minutes
    refetchInterval: 5 * 60 * 1000, // Refetch every 5 minutes
    retry: 2,
  });

  if (isLoading) {
    return (
      <div className="w-full max-w-6xl mx-auto">
        <h2 className="text-xl font-semibold text-default-900 mb-4 text-center">Quilombo Overview</h2>
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-4">
          <StatCardSkeleton />
          <StatCardSkeleton />
          <StatCardSkeleton />
          <StatCardSkeleton />
        </div>
      </div>
    );
  }

  if (isError || !stats) {
    return null; // Silently fail - statistics are not critical
  }

  const totalGroups = stats.verifiedGroups + stats.unverifiedGroups;

  return (
    <div className="w-full max-w-6xl mx-auto">
      <h2 className="text-xl font-semibold text-default-900 mb-4 text-center">Platform Overview</h2>
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-4">
        <StatCard icon={<Users size={24} />} label="Active Users" value={stats.activeUsers} />
        <StatCard icon={<CheckCircle size={24} />} label="Verified Groups" value={stats.verifiedGroups} />
        <StatCard icon={<UsersRound size={24} />} label="Total Groups" value={totalGroups} />
        <StatCard icon={<Calendar size={24} />} label="Upcoming Events" value={stats.upcomingEvents} />
      </div>
    </div>
  );
};

export default StatisticsWidget;
