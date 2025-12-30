'use client';

import { Button, Input, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader, SelectItem } from '@heroui/react';
import { Field, Form, Formik } from 'formik';
import { object, string } from 'yup';

import FieldInput from '@/components/forms/FieldInput';
import FieldSelect from '@/components/forms/FieldSelect';
import { ENTITY_TYPE, entityTypes, predicates } from '@/config/constants';
import { useDebouncedSearch } from '@/hooks/useDebouncedSearch';
import { PREDICATE_LABELS } from '@/components/genealogy/types';
import type { EntityType, Predicate } from '@/db/schema/genealogy';
import { useAddRelationship, useSearchPersons, useSearchGroups } from '@/query/genealogyProfile';

// Person-to-Person predicates (user can self-declare)
const PERSON_TO_PERSON_PREDICATES: Predicate[] = ['student_of', 'trained_under', 'influenced_by', 'family_of'];

// Person-to-Group predicates (user can self-declare)
const PERSON_TO_GROUP_PREDICATES: Predicate[] = ['member_of', 'associated_with', 'departed_from'];

// Leadership predicates are managed from the Group side
// const LEADERSHIP_PREDICATES: Predicate[] = ['teaches_at', 'founded', 'co_founded', 'leads', 'regional_coordinator_of'];

type FormValues = {
  objectType: EntityType;
  predicate: Predicate | '';
  objectId: string;
  searchTerm: string;
  startedAt: string;
  endedAt: string;
};

const validationSchema = object().shape({
  objectType: string().oneOf(entityTypes, 'Invalid entity type').required('Type is required'),
  predicate: string().oneOf(predicates).required('Relationship type is required'),
  objectId: string().required('Please select a person or group'),
  startedAt: string(),
  endedAt: string(),
});

type AddRelationshipModalProps = {
  isOpen: boolean;
  onClose: () => void;
  profileId?: string;
};

/**
 * Modal for adding a new relationship (person-to-person or person-to-group).
 * Includes search functionality to find persons/groups.
 */
const AddRelationshipModal = ({ isOpen, onClose, profileId }: AddRelationshipModalProps) => {
  const addRelationshipMutation = useAddRelationship();

  const initialValues: FormValues = {
    objectType: ENTITY_TYPE.PERSON,
    predicate: '',
    objectId: '',
    searchTerm: '',
    startedAt: '',
    endedAt: '',
  };

  const handleSubmit = async (values: FormValues) => {
    if (!profileId) {
      console.error('No profile ID provided');
      return;
    }

    try {
      await addRelationshipMutation.mutateAsync({
        predicate: values.predicate as Predicate,
        objectType: values.objectType,
        objectId: values.objectId,
        startedAt: values.startedAt || undefined,
        endedAt: values.endedAt || undefined,
      });
      onClose();
    } catch (error) {
      console.error('Failed to add relationship:', error);
    }
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} size="2xl">
      <ModalContent>
        {(onCloseModal) => (
          <Formik initialValues={initialValues} validationSchema={validationSchema} onSubmit={handleSubmit}>
            {({ values, setFieldValue, isSubmitting, isValid }) => {
              const availablePredicates =
                values.objectType === ENTITY_TYPE.PERSON ? PERSON_TO_PERSON_PREDICATES : PERSON_TO_GROUP_PREDICATES;

              return (
                <Form>
                  <ModalHeader>
                    <div className="flex flex-col">
                      <h1 className="text-xl font-semibold">Add Relationship</h1>
                      <p className="text-sm text-default-500 font-normal">Declare a connection to a mestre or group</p>
                    </div>
                  </ModalHeader>
                  <ModalBody>
                    <div className="space-y-4">
                      {/* Type selector */}
                      <Field
                        as={FieldSelect}
                        name="objectType"
                        label="Relationship To"
                        placeholder="Select type"
                        onChange={(e: React.ChangeEvent<HTMLSelectElement>) => {
                          const newType = e.target.value as EntityType;
                          setFieldValue('objectType', newType);
                          setFieldValue('predicate', ''); // Reset predicate when type changes
                          setFieldValue('objectId', ''); // Reset selection
                        }}
                      >
                        <SelectItem key="person">Person (Mestre, etc.)</SelectItem>
                        <SelectItem key="group">Group</SelectItem>
                      </Field>

                      {/* Predicate selector (filtered by objectType) */}
                      <Field
                        as={FieldSelect}
                        name="predicate"
                        label="Relationship Type"
                        placeholder="Select relationship"
                      >
                        {availablePredicates.map((predicate) => (
                          <SelectItem key={predicate}>{PREDICATE_LABELS[predicate]}</SelectItem>
                        ))}
                      </Field>

                      {/* Search and select person/group */}
                      <SearchAndSelect
                        objectType={values.objectType}
                        selectedId={values.objectId}
                        onSelect={(id) => setFieldValue('objectId', id)}
                        excludeProfileId={profileId}
                      />

                      {/* Optional: Timeline */}
                      <div className="grid grid-cols-2 gap-4">
                        <Field
                          as={FieldInput}
                          name="startedAt"
                          label="Started (optional)"
                          type="date"
                          placeholder="YYYY-MM-DD"
                        />
                        <Field
                          as={FieldInput}
                          name="endedAt"
                          label="Ended (optional)"
                          type="date"
                          placeholder="YYYY-MM-DD"
                        />
                      </div>
                    </div>
                  </ModalBody>
                  <ModalFooter>
                    <Button variant="light" onPress={onCloseModal}>
                      Cancel
                    </Button>
                    <Button
                      type="submit"
                      color="primary"
                      isLoading={isSubmitting}
                      isDisabled={!isValid || !values.objectId}
                    >
                      Add Relationship
                    </Button>
                  </ModalFooter>
                </Form>
              );
            }}
          </Formik>
        )}
      </ModalContent>
    </Modal>
  );
};

type SearchAndSelectProps = {
  objectType: EntityType;
  selectedId: string;
  onSelect: (id: string) => void;
  excludeProfileId?: string;
};

/**
 * Search component for finding persons or groups.
 * Uses React Query to search genealogy data.
 */
const SearchAndSelect = ({ objectType, selectedId, onSelect, excludeProfileId }: SearchAndSelectProps) => {
  const { inputValue, setInputValue, debouncedSearchTerm } = useDebouncedSearch();

  const { data: personResultsRaw } = useSearchPersons(debouncedSearchTerm, {
    enabled: objectType === ENTITY_TYPE.PERSON && debouncedSearchTerm.length > 2,
  });
  const { data: groupResults } = useSearchGroups(debouncedSearchTerm, {
    enabled: objectType === ENTITY_TYPE.GROUP && debouncedSearchTerm.length > 2,
  });

  // Filter out the current user's profile from person results
  const personResults = personResultsRaw?.filter((p) => p.id !== excludeProfileId);

  // Get display name for an item (person or group)
  const getDisplayName = (item: { id: string; name: string | null; apelido?: string | null }) => {
    return item.apelido || item.name || 'Unknown';
  };

  // Render for person results
  if (objectType === ENTITY_TYPE.PERSON) {
    const selectedPerson = personResults?.find((p) => p.id === selectedId);

    return (
      <div className="space-y-2">
        <Input
          label="Search Person"
          placeholder="Type to search persons..."
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
        />
        {selectedPerson && (
          <div className="p-2 bg-primary-50 rounded-md">
            {selectedPerson.title && <p className="text-xs text-default-500 capitalize">{selectedPerson.title}</p>}
            <p className="text-sm font-medium">{getDisplayName(selectedPerson)}</p>
          </div>
        )}
        {debouncedSearchTerm.length > 2 && personResults && personResults.length > 0 && (
          <div className="max-h-48 overflow-y-auto border border-default-200 rounded-md">
            {personResults.map((person) => (
              <button
                key={person.id}
                type="button"
                className="w-full text-left p-2 hover:bg-default-100 transition-colors"
                onClick={() => onSelect(person.id)}
              >
                {person.title && <p className="text-xs text-default-500 capitalize">{person.title}</p>}
                <p className="text-sm font-medium">{getDisplayName(person)}</p>
              </button>
            ))}
          </div>
        )}
        {debouncedSearchTerm.length > 2 && personResults && personResults.length === 0 && (
          <p className="text-sm text-default-400 p-2">No results found</p>
        )}
      </div>
    );
  }

  // Render for group results
  const selectedGroup = groupResults?.find((g) => g.id === selectedId);

  return (
    <div className="space-y-2">
      <Input
        label="Search Group"
        placeholder="Type to search groups..."
        value={inputValue}
        onChange={(e) => setInputValue(e.target.value)}
      />
      {selectedGroup && (
        <div className="p-2 bg-primary-50 rounded-md">
          <p className="text-sm font-medium">Selected: {selectedGroup.name}</p>
        </div>
      )}
      {debouncedSearchTerm.length > 2 && groupResults && groupResults.length > 0 && (
        <div className="max-h-48 overflow-y-auto border border-default-200 rounded-md">
          {groupResults.map((group) => (
            <button
              key={group.id}
              type="button"
              className="w-full text-left p-2 hover:bg-default-100 transition-colors"
              onClick={() => onSelect(group.id)}
            >
              <p className="text-sm font-medium">{group.name}</p>
              {group.style && <p className="text-xs text-default-500">{group.style}</p>}
            </button>
          ))}
        </div>
      )}
      {debouncedSearchTerm.length > 2 && groupResults && groupResults.length === 0 && (
        <p className="text-sm text-default-400 p-2">No results found</p>
      )}
    </div>
  );
};

export default AddRelationshipModal;
