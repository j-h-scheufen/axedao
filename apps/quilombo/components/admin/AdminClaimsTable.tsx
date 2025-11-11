'use client';

import {
  Table,
  TableHeader,
  TableColumn,
  TableBody,
  TableRow,
  TableCell,
  Button,
  Spinner,
  Link,
  useDisclosure,
  Chip,
} from '@heroui/react';
import { useQuery } from '@tanstack/react-query';
import { ExternalLinkIcon } from 'lucide-react';
import { useState } from 'react';

import { PATHS } from '@/config/constants';
import ApproveClaimModal from './ApproveClaimModal';
import RejectClaimModal from './RejectClaimModal';

type GroupClaim = {
  id: string;
  groupId: string;
  groupName: string;
  userId: string;
  userName: string;
  userEmail: string;
  requestedAt: string;
  userMessage: string;
  status: 'pending' | 'approved' | 'rejected';
};

const AdminClaimsTable = () => {
  const [selectedClaim, setSelectedClaim] = useState<GroupClaim | null>(null);
  const { isOpen: isApproveOpen, onOpen: onApproveOpen, onOpenChange: onApproveOpenChange } = useDisclosure();
  const { isOpen: isRejectOpen, onOpen: onRejectOpen, onOpenChange: onRejectOpenChange } = useDisclosure();

  const {
    data: claims,
    isLoading,
    refetch,
  } = useQuery<GroupClaim[]>({
    queryKey: ['admin-claims'],
    queryFn: async () => {
      const response = await fetch('/api/admin/claims');
      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || 'Failed to fetch claims');
      }
      return response.json();
    },
  });

  const handleApprove = (claim: GroupClaim) => {
    setSelectedClaim(claim);
    onApproveOpen();
  };

  const handleReject = (claim: GroupClaim) => {
    setSelectedClaim(claim);
    onRejectOpen();
  };

  const handleApproveSuccess = () => {
    refetch();
  };

  const handleRejectSuccess = () => {
    refetch();
  };

  if (isLoading) {
    return (
      <div className="flex justify-center p-8">
        <Spinner />
      </div>
    );
  }

  if (!claims || claims.length === 0) {
    return <div className="text-center p-8 text-default-500">No pending claims at this time.</div>;
  }

  return (
    <>
      <Table aria-label="Group claims table">
        <TableHeader>
          <TableColumn>GROUP</TableColumn>
          <TableColumn>CLAIMER</TableColumn>
          <TableColumn>REQUESTED</TableColumn>
          <TableColumn>STATUS</TableColumn>
          <TableColumn>MESSAGE</TableColumn>
          <TableColumn>ACTIONS</TableColumn>
        </TableHeader>
        <TableBody>
          {claims.map((claim) => (
            <TableRow key={claim.id}>
              <TableCell>
                <Link href={`${PATHS.groups}/${claim.groupId}`} target="_blank" className="flex items-center gap-1">
                  {claim.groupName}
                  <ExternalLinkIcon className="h-3 w-3" />
                </Link>
              </TableCell>
              <TableCell>
                <div>
                  <div className="font-medium">{claim.userName}</div>
                  <div className="text-small text-default-500">{claim.userEmail}</div>
                </div>
              </TableCell>
              <TableCell>{new Date(claim.requestedAt).toLocaleDateString()}</TableCell>
              <TableCell>
                <Chip
                  color={claim.status === 'approved' ? 'success' : claim.status === 'rejected' ? 'danger' : 'warning'}
                  size="sm"
                  variant="flat"
                >
                  {claim.status}
                </Chip>
              </TableCell>
              <TableCell>
                <div className="max-w-md text-small truncate">{claim.userMessage}</div>
              </TableCell>
              <TableCell>
                {claim.status === 'pending' && (
                  <div className="flex gap-2">
                    <Button size="sm" color="primary" onPress={() => handleApprove(claim)}>
                      Approve
                    </Button>
                    <Button size="sm" color="danger" variant="flat" onPress={() => handleReject(claim)}>
                      Reject
                    </Button>
                  </div>
                )}
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>

      {selectedClaim && (
        <>
          <ApproveClaimModal
            isOpen={isApproveOpen}
            onOpenChange={onApproveOpenChange}
            claim={selectedClaim}
            onSuccess={handleApproveSuccess}
          />
          <RejectClaimModal
            isOpen={isRejectOpen}
            onOpenChange={onRejectOpenChange}
            claim={selectedClaim}
            onSuccess={handleRejectSuccess}
          />
        </>
      )}
    </>
  );
};

export default AdminClaimsTable;
