'use client';

import { useQuery } from '@tanstack/react-query';
import { QUERY_KEYS } from '.';
import type { Proposal, ProposalStatus } from '@/hooks/state/dao';

const PROPOSALS_QUERY = `
  {
    submitProposals(first: 100, orderBy: timestamp, orderDirection: desc) {
      proposal
      proposalDataHash
      votingPeriod
      expiration
      details
      timestamp
    }
    submitVotes(first: 1000) {
      proposal
      approved
      balance
    }
    processProposals(first: 100) {
      proposal
      passed
      actionFailed
    }
    cancelProposals(first: 100) {
      proposal
    }
  }
`;

const fetchProposals = async (): Promise<Proposal[]> => {
  const response = await fetch('/api/graphql', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      query: PROPOSALS_QUERY,
      variables: null,
    }),
  });

  if (!response.ok) {
    throw new Error(`HTTP error! status: ${response.status}`);
  }

  const { data, errors } = await response.json();

  if (errors) {
    console.error('GraphQL errors:', errors);
    throw new Error(`Failed to fetch proposals: ${errors[0].message}`);
  }

  if (!data?.submitProposals?.length) {
    console.warn('No proposals found in subgraph response');
    return [];
  }

  const proposals = data.submitProposals.map((p: any) => {
    const votes = data.submitVotes.filter((v: any) => v.proposal === p.proposal);
    const yesVotes = votes.filter((v: any) => v.approved).reduce((sum: bigint, v: any) => sum + BigInt(v.balance), 0n);
    const noVotes = votes.filter((v: any) => !v.approved).reduce((sum: bigint, v: any) => sum + BigInt(v.balance), 0n);

    const processResult = data.processProposals.find((pp: any) => pp.proposal === p.proposal);
    const isCancelled = data.cancelProposals.some((cp: any) => cp.proposal === p.proposal);

    const proposal = {
      id: parseInt(p.proposal.toString()),
      proposalDataHash: p.proposalDataHash.toString() as `0x${string}`,
      votingPeriod: parseInt(p.votingPeriod.toString()),
      expiration: parseInt(p.expiration.toString()),
      details: p.details,
      status: calculateStatus(p, processResult, isCancelled, yesVotes, noVotes),
      timestamp: parseInt(p.timestamp.toString()),
    };
    return proposal;
  });

  return proposals;
};

function calculateStatus(
  proposal: any,
  processResult: any | undefined,
  isCancelled: boolean,
  yesVotes: bigint,
  noVotes: bigint
): ProposalStatus {
  if (isCancelled) return 'cancelled';
  if (processResult) {
    if (processResult.actionFailed) return 'failed';
    return processResult.passed ? 'processed' : 'defeated';
  }

  const now = BigInt(Math.floor(Date.now() / 1000));
  const votingEndTime = BigInt(proposal.timestamp.toString()) + BigInt(proposal.votingPeriod.toString());

  if (now <= votingEndTime) return 'voting';
  if (now <= BigInt(proposal.expiration.toString())) return 'grace';

  return yesVotes > noVotes ? 'ready' : 'defeated';
}

export const useGetProposals = () => {
  return useQuery({
    queryKey: [QUERY_KEYS.dao.getProposals],
    queryFn: fetchProposals,
  });
};
