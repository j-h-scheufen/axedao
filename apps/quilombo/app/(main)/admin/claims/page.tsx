import PageHeading from '@/components/PageHeading';
import AdminClaimsTable from '@/components/admin/AdminClaimsTable';

const AdminClaimsPage = () => {
  return (
    <>
      <PageHeading>Group Claims</PageHeading>
      <div className="px-4">
        <AdminClaimsTable />
      </div>
    </>
  );
};

export default AdminClaimsPage;
