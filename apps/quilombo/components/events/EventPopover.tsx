'use client';

import { Calendar, Clock, MapPin } from 'lucide-react';
import type { EventLocationFeatureProperties } from '@/types/model';

interface EventPopoverProps {
  event: EventLocationFeatureProperties;
  address: string;
  x: number;
  y: number;
  onClose: () => void;
}

const EventPopover = ({ event, address, x, y, onClose }: EventPopoverProps) => {
  const formatDate = (dateString: string, isAllDay: boolean) => {
    const date = new Date(dateString);
    if (isAllDay) {
      return date.toLocaleDateString();
    }
    return date.toLocaleString();
  };

  return (
    <div
      className="fixed z-50 bg-white rounded-lg shadow-lg border p-4 max-w-sm"
      style={{
        left: x + 10,
        top: y - 10,
        transform: 'translateY(-100%)',
      }}
    >
      <div className="flex justify-between items-start mb-2">
        <h3 className="font-semibold text-gray-900 line-clamp-2">{event.eventName}</h3>
        <button type="button" onClick={onClose} className="text-gray-400 hover:text-gray-600 ml-2">
          ×
        </button>
      </div>

      {event.eventDescription && <p className="text-sm text-gray-600 mb-2 line-clamp-2">{event.eventDescription}</p>}

      <div className="space-y-1 text-sm">
        <div className="flex items-center text-gray-600">
          <Calendar className="w-4 h-4 mr-2" />
          <span>{formatDate(event.eventStart, event.eventIsAllDay)}</span>
        </div>

        {event.eventEnd && (
          <div className="flex items-center text-gray-600">
            <Clock className="w-4 h-4 mr-2" />
            <span>Until {formatDate(event.eventEnd, event.eventIsAllDay)}</span>
          </div>
        )}

        <div className="flex items-center text-gray-600">
          <MapPin className="w-4 h-4 mr-2" />
          <span className="line-clamp-1">{address}</span>
        </div>
      </div>

      <div className="mt-2 pt-2 border-t">
        <span className="inline-block px-2 py-1 text-xs font-medium bg-blue-100 text-blue-800 rounded">
          {event.eventType}
        </span>
      </div>
    </div>
  );
};

export default EventPopover;
