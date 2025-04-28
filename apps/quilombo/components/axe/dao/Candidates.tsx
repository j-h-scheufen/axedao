"use client";

import {
	Table,
	TableBody,
	TableCell,
	TableColumn,
	TableHeader,
	TableRow,
} from "@nextui-org/table";
import { useAtomValue } from "jotai";

import UserCard from "@/components/UserCard";
import { sortedCandidatesAtom } from "@/hooks/state/dao";

export default function Candidates() {
	const sortedCandidates = useAtomValue(sortedCandidatesAtom);

	return (
		<div className="w-full flex flex-col gap-4">
			<div className="text-2xl">Council Candidates</div>
			<Table aria-label="Council candidates and their delegations">
				<TableHeader>
					<TableColumn>CANDIDATE</TableColumn>
					<TableColumn>DELEGATIONS</TableColumn>
				</TableHeader>
				<TableBody>
					{sortedCandidates.map((candidate) => (
						<TableRow
							key={candidate.walletAddress}
							className={!candidate.available ? "opacity-50" : undefined}
						>
							<TableCell>
								<div className="flex items-center gap-2">
									<UserCard user={candidate} />
									{!candidate.available && (
										<span className="text-sm text-gray-500">(Resigned)</span>
									)}
								</div>
							</TableCell>
							<TableCell>
								{typeof candidate.delegationCount === "number"
									? candidate.delegationCount.toString()
									: "0"}
							</TableCell>
						</TableRow>
					))}
				</TableBody>
			</Table>
		</div>
	);
}
