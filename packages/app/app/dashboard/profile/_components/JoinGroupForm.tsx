'use client';

import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { Button } from '@nextui-org/button';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { Field, FieldProps, Form, Formik, FormikHelpers, FormikProps } from 'formik';
import { Search } from 'lucide-react';
import { useEffect, useState } from 'react';
import { useDebounce } from 'use-debounce';

import ErrorText from '@/components/ErrorText';
import {
  useGroups,
  useGroupsActions,
  useGroupsHasMoreResults,
  useIsLoadingGroups,
  useLoadGroupsError,
} from '@/store/groups.store';
import { useProfileActions } from '@/store/profile.store';
import { joinGroupFormSchema, JoinGroupFormType } from '../schema';

const JoinGroupForm = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [searchTerm, setSearchTerm] = useState<string>('');
  const [debouncedSearchTerm] = useDebounce(searchTerm, 500);

  const groups = useGroups();
  const loadGroupsError = useLoadGroupsError();
  const isLoadingGroups = useIsLoadingGroups();
  const hasMoreGroups = useGroupsHasMoreResults();
  const { initialize, loadNextPage } = useGroupsActions();

  const { joinGroup } = useProfileActions();

  useEffect(() => {
    initialize({ searchTerm: debouncedSearchTerm });
  }, [debouncedSearchTerm, initialize]);

  const [, scrollerRef] = useInfiniteScroll({
    hasMore: hasMoreGroups,
    isEnabled: isOpen,
    shouldUseLoader: true,
    onLoadMore: loadNextPage,
  });

  const handleSubmit = (values: JoinGroupFormType, { setSubmitting }: FormikHelpers<JoinGroupFormType>) => {
    setSubmitting(true);
    try {
      return joinGroup(values.id);
    } catch (error) {
      console.error('Error during registration.', error);
      throw error;
    } finally {
      setSubmitting(false);
    }
  };

  // NOTE: The initial form values MUST BE declared outside of the JSX code, otherwise it can lead to hydration errors.
  const initValues: JoinGroupFormType = {
    id: '',
  };

  return (
    <Formik<JoinGroupFormType>
      initialValues={initValues}
      validationSchema={joinGroupFormSchema}
      onSubmit={handleSubmit}
    >
      {({ dirty, isValid, isSubmitting, setFieldValue }: FormikProps<JoinGroupFormType>) => (
        <Form>
          <Field name="id">
            {({ field }: FieldProps) => (
              <Autocomplete
                {...field}
                label="Join a group"
                placeholder="Search groups by name"
                inputProps={{ classNames: { inputWrapper: '!min-h-12' } }}
                listboxProps={{ emptyContent: isLoadingGroups ? 'Loading...' : 'No groups found' }}
                startContent={<Search className="h-4 w-4" strokeWidth={1.4} />}
                isLoading={isLoadingGroups}
                inputValue={searchTerm}
                onInputChange={setSearchTerm}
                onSelectionChange={(key) => {
                  setFieldValue('id', key?.toString() || undefined);
                }}
                scrollRef={scrollerRef}
                onOpenChange={setIsOpen}
              >
                {groups.map(({ name, id }) => (
                  <AutocompleteItem key={id} value={id} textValue={name}>
                    <div className="mb-1">{name}</div>
                  </AutocompleteItem>
                ))}
              </Autocomplete>
            )}
          </Field>
          <ErrorText message={loadGroupsError} />
          <div className="mt-5 flex justify-between gap-3">
            <Button
              type="submit"
              className="w-full flex-1"
              color="primary"
              isLoading={isSubmitting}
              disabled={!dirty || !isValid}
            >
              Join group
            </Button>
          </div>
        </Form>
      )}
    </Formik>
  );
};

export default JoinGroupForm;
