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
  Card,
  CardBody,
} from '@heroui/react';
import { Check, ExternalLinkIcon, X } from 'lucide-react';
import { useState } from 'react';

import { PATHS } from '@/config/constants';
import * as admin from '@/query/admin';
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
  const [expandedClaimId, setExpandedClaimId] = useState<string | null>(null);
  const { isOpen: isApproveOpen, onOpen: onApproveOpen, onOpenChange: onApproveOpenChange } = useDisclosure();
  const { isOpen: isRejectOpen, onOpen: onRejectOpen, onOpenChange: onRejectOpenChange } = useDisclosure();

  const { data: claims, isLoading } = admin.useFetchClaims();

  const handleApprove = (claim: GroupClaim) => {
    setSelectedClaim(claim);
    onApproveOpen();
  };

  const handleReject = (claim: GroupClaim) => {
    setSelectedClaim(claim);
    onRejectOpen();
  };

  const handleApproveSuccess = () => {
    // Query invalidation is handled by the mutation hook
  };

  const handleRejectSuccess = () => {
    // Query invalidation is handled by the mutation hook
  };

  const toggleExpanded = (claimId: string) => {
    setExpandedClaimId(expandedClaimId === claimId ? null : claimId);
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
          <TableColumn width="30%">GROUP</TableColumn>
          <TableColumn width="35%">CLAIMER</TableColumn>
          <TableColumn width="15%">DATE</TableColumn>
          <TableColumn width="10%">STATUS</TableColumn>
          <TableColumn width="10%" align="center">
            ACTIONS
          </TableColumn>
        </TableHeader>
        <TableBody>
          {claims?.map((claim: GroupClaim) => (
            <>
              <TableRow
                key={claim.id}
                className="cursor-pointer hover:bg-default-50"
                onClick={() => toggleExpanded(claim.id)}
              >
                <TableCell>
                  <Link
                    href={`${PATHS.groups}/${claim.groupId}`}
                    target="_blank"
                    className="flex items-center gap-1"
                    onClick={(e) => e.stopPropagation()}
                  >
                    {claim.groupName}
                    <ExternalLinkIcon className="h-3 w-3" />
                  </Link>
                </TableCell>
                <TableCell>
                  <div className="text-small">
                    <div className="font-medium">{claim.userName}</div>
                    <div className="text-default-500 truncate max-w-[200px]">{claim.userEmail}</div>
                  </div>
                </TableCell>
                <TableCell className="text-small">{new Date(claim.requestedAt).toLocaleDateString()}</TableCell>
                <TableCell>
                  <Chip
                    color={claim.status === 'approved' ? 'success' : claim.status === 'rejected' ? 'danger' : 'warning'}
                    size="sm"
                    variant="flat"
                  >
                    {claim.status}
                  </Chip>
                </TableCell>
                <TableCell onClick={(e) => e.stopPropagation()}>
                  {claim.status === 'pending' && (
                    <div className="flex gap-1 justify-center">
                      <Button
                        isIconOnly
                        size="sm"
                        color="success"
                        variant="flat"
                        onPress={() => handleApprove(claim)}
                        aria-label="Approve claim"
                      >
                        <Check className="h-4 w-4" />
                      </Button>
                      <Button
                        isIconOnly
                        size="sm"
                        color="danger"
                        variant="flat"
                        onPress={() => handleReject(claim)}
                        aria-label="Reject claim"
                      >
                        <X className="h-4 w-4" />
                      </Button>
                    </div>
                  )}
                </TableCell>
              </TableRow>
              {expandedClaimId === claim.id && (
                <TableRow key={`${claim.id}-expanded`}>
                  <TableCell colSpan={5} className="bg-default-50">
                    <Card className="shadow-none">
                      <CardBody>
                        <div className="space-y-3">
                          <div>
                            <div className="text-small font-semibold text-default-700 mb-1">Full Message:</div>
                            <div className="text-small text-default-600 whitespace-pre-wrap">{claim.userMessage}</div>
                          </div>
                          <div className="grid grid-cols-2 gap-4 text-small">
                            <div>
                              <span className="font-semibold text-default-700">Group:</span> {claim.groupName}
                            </div>
                            <div>
                              <span className="font-semibold text-default-700">Claimer:</span> {claim.userName}
                            </div>
                            <div>
                              <span className="font-semibold text-default-700">Email:</span> {claim.userEmail}
                            </div>
                            <div>
                              <span className="font-semibold text-default-700">Requested:</span>{' '}
                              {new Date(claim.requestedAt).toLocaleString()}
                            </div>
                          </div>
                        </div>
                      </CardBody>
                    </Card>
                  </TableCell>
                </TableRow>
              )}
            </>
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
