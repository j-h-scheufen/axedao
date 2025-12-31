'use client';

import { Card, CardBody, Skeleton } from '@heroui/react';
import { Users, UsersRound, Calendar, MapPin, UserRound, Building2 } from 'lucide-react';
import Link from 'next/link';

import { PATHS } from '@/config/constants';
import { stats } from '@/query';

interface StatCardProps {
  icon: React.ReactNode;
  label: string;
  value: number;
  href: string;
}

const StatCard = ({ icon, label, value, href }: StatCardProps) => {
  return (
    <Card
      as={Link}
      href={href}
      isPressable
      className="shadow-[0_4px_14px_0_rgba(0,0,0,0.25)] hover:shadow-[0_6px_20px_0_rgba(0,0,0,0.35)] sm:hover:scale-105 transition-all duration-200 border border-primary-200/60 dark:border-primary-800/40 border-t-primary-100/80 border-l-primary-100/80 dark:border-t-primary-900/30 dark:border-l-primary-900/30"
    >
      <CardBody className="flex flex-col items-center gap-2 p-4">
        <div className="flex flex-row items-center gap-3">
          <div className="text-primary-400 dark:text-primary-500 border border-primary-300 dark:border-primary-600 rounded-md p-1.5 bg-gradient-to-br from-primary-50/50 to-transparent dark:from-primary-950/30 dark:to-transparent">
            {icon}
          </div>
          <span className="text-2xl font-bold text-default-900 dark:text-default-800">
            {(value ?? 0).toLocaleString()}
          </span>
        </div>
        <span className="text-sm text-default-500 dark:text-default-600 text-center">{label}</span>
      </CardBody>
    </Card>
  );
};

const StatCardSkeleton = () => {
  return (
    <Card className="shadow-[0_4px_14px_0_rgba(0,0,0,0.25)] border border-primary-200/60 dark:border-primary-800/40 border-t-primary-100/80 border-l-primary-100/80 dark:border-t-primary-900/30 dark:border-l-primary-900/30">
      <CardBody className="flex flex-col items-center gap-2 p-4">
        <div className="flex flex-row items-center gap-3">
          <Skeleton className="w-9 h-9 rounded-md" />
          <Skeleton className="h-7 w-16 rounded-lg" />
        </div>
        <Skeleton className="h-4 w-24 rounded-lg" />
      </CardBody>
    </Card>
  );
};

/**
 * StatisticsWidget displays public platform statistics in a grid of cards.
 * Fetches data from /api/stats with automatic caching and refetching.
 */
const StatisticsWidget = () => {
  const { data: publicStats, isLoading, isError } = stats.useFetchPublicStats();

  if (isLoading) {
    return (
      <div className="w-full mx-auto">
        <h2 className="text-xl font-semibold text-default-900 mb-2 sm:mb-4 text-center">Statistics</h2>
        <div className="grid grid-cols-3 gap-4">
          <StatCardSkeleton />
          <StatCardSkeleton />
          <StatCardSkeleton />
          <StatCardSkeleton />
          <StatCardSkeleton />
          <StatCardSkeleton />
        </div>
      </div>
    );
  }

  if (isError || !publicStats) {
    return null; // Silently fail - statistics are not critical
  }

  return (
    <div className="w-full mx-auto">
      <h2 className="text-xl font-semibold text-default-900 mb-2 sm:mb-4 text-center">Statistics</h2>
      <div className="grid grid-cols-3 gap-4">
        {/* Row 1: Groups, Capoeiras, Upcoming Events */}
        <StatCard
          icon={<UsersRound size={24} />}
          label="Groups"
          value={publicStats.genealogy.groups}
          href={`${PATHS.genealogy}?type=group`}
        />
        <StatCard
          icon={<UserRound size={24} />}
          label="Capoeiras"
          value={publicStats.genealogy.persons}
          href={`${PATHS.genealogy}?type=person`}
        />
        <StatCard
          icon={<Calendar size={24} />}
          label="Upcoming Events"
          value={publicStats.platform.upcomingEvents}
          href={`${PATHS.search}?tab=events`}
        />
        {/* Row 2: Managed Groups, Users, Active Locations */}
        <StatCard
          icon={<Building2 size={24} />}
          label="Managed Groups"
          value={publicStats.platform.managedGroups}
          href={`${PATHS.search}?tab=groups`}
        />
        <StatCard
          icon={<Users size={24} />}
          label="Users"
          value={publicStats.platform.users}
          href={`${PATHS.search}?tab=users`}
        />
        <StatCard
          icon={<MapPin size={24} />}
          label="Locations"
          value={publicStats.platform.groupLocations}
          href={`${PATHS.search}?tab=groups&view=map`}
        />
      </div>
    </div>
  );
};

export default StatisticsWidget;
