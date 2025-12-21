'use client';

import {
  Avatar,
  Button,
  Chip,
  Divider,
  Link,
  Modal,
  ModalBody,
  ModalContent,
  ModalHeader,
  Spinner,
} from '@heroui/react';
import { ExternalLink, FileText } from 'lucide-react';
import { useMemo, useState } from 'react';

import { useResponsiveLayout } from '@/hooks/useResponsiveLayout';

import type { GroupFullProfile, NameHistoryEntry, PersonFullProfile } from '@/components/genealogy/types';
import { type Language, LanguageSwitch } from './LanguageSwitch';

/**
 * Field labels in English and Portuguese.
 */
const FIELD_LABELS: Record<string, Record<Language, string>> = {
  // Person fields
  name: { en: 'Full Name', pt: 'Nome Completo' },
  apelido: { en: 'Apelido (Nickname)', pt: 'Apelido' },
  apelidoContext: { en: 'Context', pt: 'Contexto' },
  title: { en: 'Title', pt: 'Título' },
  style: { en: 'Style', pt: 'Estilo' },
  styleNotes: { en: 'Style Notes', pt: 'Notas sobre Estilo' },
  lifespan: { en: 'Lifespan', pt: 'Vida' },
  birthPlace: { en: 'Birth Place', pt: 'Local de Nascimento' },
  deathPlace: { en: 'Death Place', pt: 'Local de Falecimento' },
  bio: { en: 'Biography', pt: 'Biografia' },
  achievements: { en: 'Achievements', pt: 'Conquistas' },
  notes: { en: 'Research Notes', pt: 'Notas de Pesquisa' },
  publicLinks: { en: 'References', pt: 'Referências' },
  // Group fields
  groupName: { en: 'Name', pt: 'Nome' },
  aliases: { en: 'Also Known As', pt: 'Também Conhecido Como' },
  description: { en: 'Description', pt: 'Descrição' },
  founded: { en: 'Founded', pt: 'Fundação' },
  philosophy: { en: 'Philosophy', pt: 'Filosofia' },
  history: { en: 'History', pt: 'História' },
  nameHistory: { en: 'Name History', pt: 'Histórico de Nomes' },
  legalStructure: { en: 'Legal Structure', pt: 'Estrutura Legal' },
  status: { en: 'Status', pt: 'Status' },
  dissolvedAt: { en: 'Dissolved', pt: 'Dissolvido' },
  // Common
  createdAt: { en: 'Record Created', pt: 'Registro Criado' },
  updatedAt: { en: 'Last Updated', pt: 'Última Atualização' },
};

/**
 * Get the label for a field in the current language.
 */
function getLabel(field: string, lang: Language): string {
  return FIELD_LABELS[field]?.[lang] || field;
}

/**
 * Format a year with precision indicator.
 */
function formatYear(year: number | null | undefined, precision?: string | null): string {
  if (!year) return '';
  switch (precision) {
    case 'exact':
      return year.toString();
    case 'approximate':
      return `c. ${year}`;
    case 'decade':
      return `${Math.floor(year / 10) * 10}s`;
    case 'century':
      return `${Math.floor(year / 100) + 1}th century`;
    default:
      return year.toString();
  }
}

/**
 * Format a date for display.
 */
function formatDate(dateStr: string | null | undefined): string {
  if (!dateStr) return '';
  try {
    const date = new Date(dateStr);
    return date.toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' });
  } catch {
    return dateStr;
  }
}

/**
 * Format legal structure for display.
 */
function formatLegalStructure(structure: string | null | undefined, lang: Language): string {
  if (!structure) return '';
  const labels: Record<string, Record<Language, string>> = {
    nonprofit: { en: 'Non-profit Organization', pt: 'Organização Sem Fins Lucrativos' },
    informal: { en: 'Informal Association', pt: 'Associação Informal' },
    company: { en: 'Company', pt: 'Empresa' },
    foundation: { en: 'Foundation', pt: 'Fundação' },
  };
  return labels[structure]?.[lang] || structure;
}

interface FieldDisplayProps {
  label: string;
  children: React.ReactNode;
  className?: string;
}

/**
 * A field display component with label and content.
 */
function FieldDisplay({ label, children, className = '' }: FieldDisplayProps) {
  return (
    <div className={className}>
      <p className="text-tiny font-semibold uppercase tracking-wide text-default-500">{label}</p>
      <div className="mt-1">{children}</div>
    </div>
  );
}

interface PersonFullDetailsProps {
  profile: PersonFullProfile;
  lang: Language;
}

/**
 * Display component for person full details.
 */
function PersonFullDetails({ profile, lang }: PersonFullDetailsProps) {
  const bio = lang === 'pt' ? profile.bioPt : profile.bioEn;
  const achievements = lang === 'pt' ? profile.achievementsPt : profile.achievementsEn;
  const styleNotes = lang === 'pt' ? profile.styleNotesPt : profile.styleNotesEn;
  const notes = lang === 'pt' ? profile.notesPt : profile.notesEn;

  // Build the display name with title prefix
  const titleCapitalized = profile.title ? profile.title.charAt(0).toUpperCase() + profile.title.slice(1) : null;
  const displayName = titleCapitalized
    ? `${titleCapitalized} ${profile.apelido || profile.name || 'Unknown'}`
    : profile.apelido || profile.name || 'Unknown';

  const lifespan = useMemo(() => {
    if (!profile.birthYear && !profile.deathYear) return null;
    const birth = formatYear(profile.birthYear, profile.birthYearPrecision) || '?';
    const death = profile.deathYear
      ? formatYear(profile.deathYear, profile.deathYearPrecision)
      : profile.birthYear && new Date().getFullYear() - profile.birthYear > 120
        ? '?'
        : 'Present';
    return `${birth} — ${death}`;
  }, [profile.birthYear, profile.birthYearPrecision, profile.deathYear, profile.deathYearPrecision]);

  return (
    <div className="space-y-6">
      {/* Header with avatar */}
      <div className="flex items-start gap-4">
        <Avatar src={profile.portrait || undefined} name={displayName} size="lg" className="h-20 w-20 shrink-0" />
        <div className="min-w-0 flex-1">
          <h3 className="text-xl font-bold">{displayName}</h3>
          {profile.name && profile.name !== profile.apelido && <p className="text-default-600">{profile.name}</p>}
          {profile.style && (
            <div className="mt-2">
              <Chip size="sm" variant="flat" color="secondary">
                {profile.style.charAt(0).toUpperCase() + profile.style.slice(1)}
              </Chip>
            </div>
          )}
        </div>
      </div>

      <Divider />

      {/* Identity Section */}
      <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
        {profile.apelidoContext && (
          <FieldDisplay label={getLabel('apelidoContext', lang)}>
            <p>{profile.apelidoContext}</p>
          </FieldDisplay>
        )}

        {lifespan && (
          <FieldDisplay label={getLabel('lifespan', lang)}>
            <p>{lifespan}</p>
          </FieldDisplay>
        )}

        {profile.birthPlace && (
          <FieldDisplay label={getLabel('birthPlace', lang)}>
            <p>{profile.birthPlace}</p>
          </FieldDisplay>
        )}

        {profile.deathPlace && (
          <FieldDisplay label={getLabel('deathPlace', lang)}>
            <p>{profile.deathPlace}</p>
          </FieldDisplay>
        )}
      </div>

      {/* Style Notes */}
      {styleNotes && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('styleNotes', lang)}>
            <p className="whitespace-pre-wrap">{styleNotes}</p>
          </FieldDisplay>
        </>
      )}

      {/* Biography */}
      {bio && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('bio', lang)}>
            <p className="whitespace-pre-wrap">{bio}</p>
          </FieldDisplay>
        </>
      )}

      {/* Achievements */}
      {achievements && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('achievements', lang)}>
            <p className="whitespace-pre-wrap">{achievements}</p>
          </FieldDisplay>
        </>
      )}

      {/* Research Notes */}
      {notes && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('notes', lang)}>
            <p className="whitespace-pre-wrap text-default-600 italic">{notes}</p>
          </FieldDisplay>
        </>
      )}

      {/* Public Links */}
      {profile.publicLinks && profile.publicLinks.length > 0 && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('publicLinks', lang)}>
            <div className="flex flex-col gap-1">
              {profile.publicLinks.map((url) => (
                <Link
                  key={url}
                  href={url}
                  isExternal
                  showAnchorIcon
                  anchorIcon={<ExternalLink className="ml-1 h-3 w-3" />}
                  className="text-small truncate"
                >
                  {url}
                </Link>
              ))}
            </div>
          </FieldDisplay>
        </>
      )}

      {/* Metadata */}
      {(profile.createdAt || profile.updatedAt) && (
        <>
          <Divider />
          <div className="grid grid-cols-2 gap-4 text-tiny text-default-400">
            {profile.createdAt && (
              <div>
                <span className="font-medium">{getLabel('createdAt', lang)}:</span> {formatDate(profile.createdAt)}
              </div>
            )}
            {profile.updatedAt && (
              <div>
                <span className="font-medium">{getLabel('updatedAt', lang)}:</span> {formatDate(profile.updatedAt)}
              </div>
            )}
          </div>
        </>
      )}
    </div>
  );
}

interface GroupFullDetailsProps {
  profile: GroupFullProfile;
  lang: Language;
}

/**
 * Display component for group full details.
 */
function GroupFullDetails({ profile, lang }: GroupFullDetailsProps) {
  const description = lang === 'pt' ? profile.descriptionPt : profile.descriptionEn;
  const philosophy = lang === 'pt' ? profile.philosophyPt : profile.philosophyEn;
  const history = lang === 'pt' ? profile.historyPt : profile.historyEn;
  const styleNotes = lang === 'pt' ? profile.styleNotesPt : profile.styleNotesEn;
  const notes = lang === 'pt' ? profile.notesPt : profile.notesEn;

  const founded = useMemo(() => {
    if (!profile.foundedYear) return null;
    const year = formatYear(profile.foundedYear, profile.foundedYearPrecision);
    return profile.foundedLocation ? `${year} in ${profile.foundedLocation}` : year;
  }, [profile.foundedYear, profile.foundedYearPrecision, profile.foundedLocation]);

  return (
    <div className="space-y-6">
      {/* Header with logo */}
      <div className="flex items-start gap-4">
        <Avatar
          src={profile.logo || undefined}
          name={profile.name.charAt(0)}
          size="lg"
          radius="sm"
          className="h-20 w-20 shrink-0"
        />
        <div className="min-w-0 flex-1">
          <h3 className="text-xl font-bold">{profile.name}</h3>
          {profile.nameAliases && profile.nameAliases.length > 0 && (
            <p className="text-default-500">{profile.nameAliases.join(', ')}</p>
          )}
          <div className="mt-2 flex flex-wrap gap-2">
            {profile.style && (
              <Chip size="sm" variant="flat" color="secondary">
                {profile.style.charAt(0).toUpperCase() + profile.style.slice(1)}
              </Chip>
            )}
            <Chip size="sm" variant="flat" color={profile.isActive ? 'success' : 'default'}>
              {profile.isActive ? (lang === 'pt' ? 'Ativo' : 'Active') : lang === 'pt' ? 'Inativo' : 'Inactive'}
            </Chip>
            {profile.isHeadquarters && (
              <Chip size="sm" variant="flat" color="warning">
                {lang === 'pt' ? 'Sede' : 'Headquarters'}
              </Chip>
            )}
          </div>
        </div>
      </div>

      <Divider />

      {/* Basic Info */}
      <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
        {founded && (
          <FieldDisplay label={getLabel('founded', lang)}>
            <p>{founded}</p>
          </FieldDisplay>
        )}

        {profile.legalStructure && (
          <FieldDisplay label={getLabel('legalStructure', lang)}>
            <p>{formatLegalStructure(profile.legalStructure, lang)}</p>
          </FieldDisplay>
        )}

        {profile.dissolvedAt && (
          <FieldDisplay label={getLabel('dissolvedAt', lang)}>
            <p>{formatDate(profile.dissolvedAt)}</p>
          </FieldDisplay>
        )}
      </div>

      {/* Style Notes */}
      {styleNotes && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('styleNotes', lang)}>
            <p className="whitespace-pre-wrap">{styleNotes}</p>
          </FieldDisplay>
        </>
      )}

      {/* Description */}
      {description && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('description', lang)}>
            <p className="whitespace-pre-wrap">{description}</p>
          </FieldDisplay>
        </>
      )}

      {/* Philosophy */}
      {philosophy && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('philosophy', lang)}>
            <p className="whitespace-pre-wrap">{philosophy}</p>
          </FieldDisplay>
        </>
      )}

      {/* History */}
      {history && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('history', lang)}>
            <p className="whitespace-pre-wrap">{history}</p>
          </FieldDisplay>
        </>
      )}

      {/* Name History */}
      {profile.nameHistory && profile.nameHistory.length > 0 && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('nameHistory', lang)}>
            <div className="space-y-2">
              {profile.nameHistory.map((entry: NameHistoryEntry) => (
                <div key={`${entry.name}-${entry.startedAt}`} className="rounded-lg border border-default-200 p-2">
                  <p className="font-medium">{entry.name}</p>
                  <p className="text-small text-default-500">
                    {formatDate(entry.startedAt)} — {entry.endedAt ? formatDate(entry.endedAt) : 'Present'}
                  </p>
                  {entry.changeReason && <p className="text-small text-default-400">{entry.changeReason}</p>}
                </div>
              ))}
            </div>
          </FieldDisplay>
        </>
      )}

      {/* Research Notes */}
      {notes && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('notes', lang)}>
            <p className="whitespace-pre-wrap text-default-600 italic">{notes}</p>
          </FieldDisplay>
        </>
      )}

      {/* Public Links / References */}
      {profile.publicLinks && profile.publicLinks.length > 0 && (
        <>
          <Divider />
          <FieldDisplay label={getLabel('publicLinks', lang)}>
            <div className="flex flex-col gap-1">
              {profile.publicLinks.map((url) => (
                <Link
                  key={url}
                  href={url}
                  isExternal
                  showAnchorIcon
                  anchorIcon={<ExternalLink className="ml-1 h-3 w-3" />}
                  className="text-small truncate"
                >
                  {url}
                </Link>
              ))}
            </div>
          </FieldDisplay>
        </>
      )}

      {/* Metadata */}
      {(profile.createdAt || profile.updatedAt) && (
        <>
          <Divider />
          <div className="grid grid-cols-2 gap-4 text-tiny text-default-400">
            {profile.createdAt && (
              <div>
                <span className="font-medium">{getLabel('createdAt', lang)}:</span> {formatDate(profile.createdAt)}
              </div>
            )}
            {profile.updatedAt && (
              <div>
                <span className="font-medium">{getLabel('updatedAt', lang)}:</span> {formatDate(profile.updatedAt)}
              </div>
            )}
          </div>
        </>
      )}
    </div>
  );
}

interface FullDetailsModalProps {
  isOpen: boolean;
  onClose: () => void;
  entityType: 'person' | 'group' | null;
  entityId: string | null;
  entityName: string;
}

/**
 * Modal for displaying the full genealogy record of a person or group.
 * Includes a language toggle for bilingual content.
 */
export function FullDetailsModal({ isOpen, onClose, entityType, entityId, entityName }: FullDetailsModalProps) {
  const [language, setLanguage] = useState<Language>('en');
  const [profile, setProfile] = useState<PersonFullProfile | GroupFullProfile | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const { useFullScreenModals } = useResponsiveLayout();

  // Fetch profile when modal opens
  useMemo(() => {
    if (!isOpen || !entityType || !entityId) {
      setProfile(null);
      setError(null);
      return;
    }

    setIsLoading(true);
    setError(null);

    fetch(`/api/public/genealogy/${entityType}s/${entityId}`)
      .then((res) => {
        if (!res.ok) throw new Error('Failed to fetch profile');
        return res.json();
      })
      .then((data) => {
        setProfile(data.data);
        setIsLoading(false);
      })
      .catch((err) => {
        console.error('Error fetching full profile:', err);
        setError(err.message);
        setIsLoading(false);
      });
  }, [isOpen, entityType, entityId]);

  // Build the report title based on entity type and profile data
  const reportTitle = useMemo(() => {
    const prefix = language === 'pt' ? 'Relatório de Genealogia da Capoeira para' : 'Capoeira Genealogy Report for';

    if (!profile) return `${prefix} ${entityName}`;

    if (entityType === 'person') {
      const personProfile = profile as PersonFullProfile;
      const titleCap = personProfile.title
        ? personProfile.title.charAt(0).toUpperCase() + personProfile.title.slice(1)
        : null;
      const name = personProfile.apelido || personProfile.name || entityName;
      return titleCap ? `${prefix} ${titleCap} ${name}` : `${prefix} ${name}`;
    }
    // Group
    return `${prefix} ${(profile as GroupFullProfile).name || entityName}`;
  }, [profile, entityType, entityName, language]);

  return (
    <Modal
      isOpen={isOpen}
      onClose={onClose}
      size={useFullScreenModals ? 'full' : '3xl'}
      scrollBehavior="inside"
      classNames={{
        base: useFullScreenModals ? '' : 'max-h-[90vh]',
        body: 'py-6',
      }}
    >
      <ModalContent>
        <ModalHeader className="flex flex-col gap-1">
          <div className="flex items-center justify-between pr-8">
            <div className="flex items-center gap-2">
              <FileText className="h-5 w-5 text-default-500" />
              <span>{reportTitle}</span>
            </div>
            <LanguageSwitch language={language} onLanguageChange={setLanguage} />
          </div>
        </ModalHeader>
        <ModalBody>
          {isLoading ? (
            <div className="flex items-center justify-center py-12">
              <Spinner size="lg" label={language === 'pt' ? 'Carregando...' : 'Loading...'} />
            </div>
          ) : error ? (
            <div className="flex flex-col items-center justify-center py-12 text-center">
              <p className="text-danger">{language === 'pt' ? 'Erro ao carregar' : 'Error loading profile'}</p>
              <p className="text-small text-default-500">{error}</p>
              <Button size="sm" variant="flat" className="mt-4" onPress={onClose}>
                {language === 'pt' ? 'Fechar' : 'Close'}
              </Button>
            </div>
          ) : profile ? (
            entityType === 'person' ? (
              <PersonFullDetails profile={profile as PersonFullProfile} lang={language} />
            ) : (
              <GroupFullDetails profile={profile as GroupFullProfile} lang={language} />
            )
          ) : (
            <div className="flex items-center justify-center py-12">
              <p className="text-default-500">{language === 'pt' ? 'Nenhum dado disponível' : 'No data available'}</p>
            </div>
          )}
        </ModalBody>
      </ModalContent>
    </Modal>
  );
}

export default FullDetailsModal;
