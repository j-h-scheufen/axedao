type Props = {
  verified: boolean;
  claimed: boolean;
};

/**
 * Custom SVG icon showing group verification and claim status
 *
 * Design:
 * - Outer ring: Claimed status (primary green if claimed, light gray if unclaimed)
 * - Inner circle: Verified status (primary-600 darker green if verified, darker gray if unverified)
 * - Black separator between layers for visual distinction
 *
 * Colors match HeroUI primary palette:
 * - primary (claimed): #17c964
 * - primary-600 (verified): #12a150
 * - default-300 (unclaimed): #d4d4d8
 * - default-400 (unverified): #a1a1aa
 */
const GroupStatusIcon = ({ verified, claimed }: Props) => {
  // Color definitions matching HeroUI theme
  const outerRingColor = claimed ? '#17c964' : '#d4d4d8'; // primary : default-300
  const innerCircleColor = verified ? '#12a150' : '#a1a1aa'; // primary-600 : default-400

  return (
    <svg
      width="20"
      height="20"
      viewBox="0 0 20 20"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      role="img"
      aria-label="Group status indicator"
    >
      {/* Outer ring - Claimed status */}
      <circle cx="10" cy="10" r="9.5" fill={outerRingColor} stroke="black" strokeWidth="1" />

      {/* Inner circle - Verified status */}
      <circle cx="10" cy="10" r="6" fill={innerCircleColor} stroke="black" strokeWidth="1" />

      {/* Optional: Add icons based on status */}
      {verified && (
        // Checkmark icon for verified
        <path
          d="M7 10l2 2 4-4"
          stroke="white"
          strokeWidth="1.5"
          strokeLinecap="round"
          strokeLinejoin="round"
          fill="none"
        />
      )}
    </svg>
  );
};

export default GroupStatusIcon;
