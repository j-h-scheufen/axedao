"use client";

import { Button } from "@nextui-org/button";
import { useSnackbar } from "notistack";
import { useEffect, useState } from "react";
import type { Address } from "viem";
import { useAccount, useWaitForTransactionReceipt } from "wagmi";

import DelegateForm from "@/components/forms/DelegateForm";
import UserCard from "@/components/UserCard";
import ENV from "@/config/environment";
import type { MembershipDelegateForm } from "@/config/validation-schema";
import {
	useReadAxeMembershipDelegations,
	useWriteAxeMembershipDelegate,
	useWriteAxeMembershipUndelegate,
} from "@/generated";
import { candidatesAtom } from "@/hooks/state/dao";
import type { User } from "@/types/model";
import { useAtomValue } from "jotai";

const VoteDelegation: React.FC = () => {
	const account = useAccount();
	const { enqueueSnackbar } = useSnackbar();
	const [showDelegateForm, setShowDelegateForm] = useState(false);
	const [selectedCandidate, setSelectedCandidate] = useState<User | null>(null);
	const candidates = useAtomValue(candidatesAtom);

	// Read current delegation
	const { data: currentDelegationAddress, refetch: refetchCurrentDelegation } =
		useReadAxeMembershipDelegations({
			address: ENV.axeMembershipAddress,
			args: [account.address as Address],
		});

	// Contract interaction hooks
	const {
		data: delegateHash,
		isPending: delegatePending,
		writeContract: delegate,
	} = useWriteAxeMembershipDelegate();

	const {
		data: undelegateHash,
		isPending: undelegatePending,
		writeContract: undelegate,
	} = useWriteAxeMembershipUndelegate();

	// Transaction receipt hooks
	const {
		isSuccess: delegateSuccess,
		error: delegateError,
		isLoading: delegateLoading,
	} = useWaitForTransactionReceipt({ hash: delegateHash });

	const {
		isSuccess: undelegateSuccess,
		error: undelegateError,
		isLoading: undelegateLoading,
	} = useWaitForTransactionReceipt({ hash: undelegateHash });

	// Handle transaction states
	useEffect(() => {
		if (delegateLoading) {
			enqueueSnackbar("Delegating vote. Please wait for confirmation...", {
				autoHideDuration: 3000,
			});
		} else if (delegateSuccess) {
			enqueueSnackbar("Successfully delegated vote!");
			setShowDelegateForm(false);
			refetchCurrentDelegation();
		} else if (delegateError) {
			enqueueSnackbar(`Failed to delegate: ${delegateError.message}`, {
				variant: "error",
			});
		}
	}, [
		delegateLoading,
		delegateSuccess,
		delegateError,
		enqueueSnackbar,
		refetchCurrentDelegation,
	]);

	useEffect(() => {
		if (undelegateLoading) {
			enqueueSnackbar("Removing delegation. Please wait for confirmation...", {
				autoHideDuration: 3000,
			});
		} else if (undelegateSuccess) {
			enqueueSnackbar("Successfully removed delegation!");
			refetchCurrentDelegation();
		} else if (undelegateError) {
			enqueueSnackbar(`Failed to undelegate: ${undelegateError.message}`, {
				variant: "error",
			});
		}
	}, [
		undelegateLoading,
		undelegateSuccess,
		undelegateError,
		enqueueSnackbar,
		refetchCurrentDelegation,
	]);

	useEffect(() => {
		if (currentDelegationAddress === selectedCandidate?.walletAddress) return;
		let newSelection: User | undefined = undefined;
		if (currentDelegationAddress) {
			newSelection = candidates?.find(
				(candidate) => candidate.walletAddress === currentDelegationAddress,
			);
		}
		setSelectedCandidate(newSelection || null);
	}, [currentDelegationAddress, selectedCandidate, candidates]);

	const handleSubmit = async (values: MembershipDelegateForm) => {
		await delegate({
			address: ENV.axeMembershipAddress,
			args: [values.candidate as Address],
		});
	};

	const handleUndelegate = () => {
		undelegate({ address: ENV.axeMembershipAddress });
	};

	const hasActiveDelegation =
		currentDelegationAddress &&
		currentDelegationAddress !== "0x0000000000000000000000000000000000000000";

	return (
		<div className="flex flex-col w-full">
			{hasActiveDelegation ? (
				!showDelegateForm ? (
					<div className="flex flex-col gap-2 sm:gap-4">
						<p>
							Your are currently delegating to
							{selectedCandidate?.walletAddress === account.address
								? " yourself"
								: ""}
							:
						</p>
						{selectedCandidate && <UserCard user={selectedCandidate} />}
						<div className="flex gap-2">
							<Button variant="flat" onPress={() => setShowDelegateForm(true)}>
								Change
							</Button>
							<Button
								color="danger"
								variant="flat"
								onPress={handleUndelegate}
								isLoading={undelegatePending || undelegateLoading}
							>
								Undelegate
							</Button>
						</div>
					</div>
				) : (
					<div className="flex flex-col gap-2 sm:gap-4">
						<p>
							Delegate your vote to a candidate to help them get onto the
							council.
						</p>
						<DelegateForm
							onSubmit={handleSubmit}
							onCancel={() => setShowDelegateForm(false)}
							isLoading={delegatePending || delegateLoading}
							candidates={candidates ?? []}
							currentDelegationAddress={currentDelegationAddress}
						/>
					</div>
				)
			) : !showDelegateForm ? (
				<div className="flex flex-col gap-2 sm:gap-4">
					<p>
						Delegate your vote to a candidate to help them get onto the council.
						By enlisting, you automatically delegate to yourself.
					</p>
					<Button color="primary" onPress={() => setShowDelegateForm(true)}>
						Delegate
					</Button>
				</div>
			) : (
				<DelegateForm
					onSubmit={handleSubmit}
					onCancel={() => setShowDelegateForm(false)}
					isLoading={delegatePending || delegateLoading}
					candidates={candidates ?? []}
					currentDelegationAddress={currentDelegationAddress}
				/>
			)}
		</div>
	);
};

export default VoteDelegation;
