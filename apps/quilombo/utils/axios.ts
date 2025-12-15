import axios from 'axios';

/**
 * ISO 8601 date string regex pattern
 * Matches formats like:
 * - 2024-01-15T10:30:00.000Z
 * - 2024-01-15T10:30:00Z
 * - 2024-01-15T10:30:00.123456Z
 */
const ISO_DATE_REGEX = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d{3,})?Z?$/;

/**
 * Recursively converts ISO 8601 date strings to Date objects in response data.
 *
 * This function traverses objects and arrays, converting any string values that
 * match the ISO 8601 date format into proper Date objects.
 *
 * @param obj - The object to process (can be any type)
 * @returns The processed object with date strings converted to Date objects
 *
 * @example
 * const data = { createdAt: "2024-01-15T10:30:00.000Z", name: "Test" };
 * const result = convertDates(data);
 * // result.createdAt is now a Date object
 */
function convertDates(obj: unknown): unknown {
  if (obj === null || obj === undefined) {
    return obj;
  }

  // Handle arrays
  if (Array.isArray(obj)) {
    return obj.map(convertDates);
  }

  // Handle objects
  if (typeof obj === 'object') {
    const converted: Record<string, unknown> = {};
    for (const [key, value] of Object.entries(obj)) {
      // Convert string values that match ISO date format
      if (typeof value === 'string' && ISO_DATE_REGEX.test(value)) {
        converted[key] = new Date(value);
      } else {
        converted[key] = convertDates(value);
      }
    }
    return converted;
  }

  return obj;
}

/**
 * Custom axios instance with automatic date conversion.
 *
 * This interceptor automatically converts ISO 8601 date strings to Date objects
 * in all JSON responses. This eliminates the need for manual date conversion
 * in query functions.
 *
 * @example
 * import axios from '@/utils/axios';
 *
 * // Date fields are automatically converted
 * const response = await axios.get('/api/groups/123');
 * // response.data.createdAt is a Date object, not a string
 */
axios.interceptors.response.use(
  (response) => {
    // Only process JSON responses
    if (response.headers['content-type']?.includes('application/json')) {
      response.data = convertDates(response.data);
    }
    return response;
  },
  (error) => Promise.reject(error)
);

export default axios;
