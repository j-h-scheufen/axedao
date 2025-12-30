'use client';

import { Button, Divider, Link, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { useAtom } from 'jotai';
import { BookOpen, GitBranch, ShieldCheck, Users } from 'lucide-react';

import { genealogyLanguageAtom } from '@/components/genealogy/state';
import { LanguageSwitch } from './LanguageSwitch';

interface GenealogyInfoModalProps {
  isOpen: boolean;
  onClose: () => void;
}

const GITHUB_README_URL = 'https://github.com/j-h-scheufen/axedao/blob/main/docs/genealogy/README.md';

/** Bilingual content for the info modal. */
const CONTENT = {
  title: {
    en: 'About the Capoeira Genealogy Project',
    pt: 'Sobre o Projeto de Genealogia da Capoeira',
  },
  subtitle: {
    en: 'In honor of those who taught us',
    pt: 'Em homenagem aos que nos ensinaram',
  },
  sections: {
    purpose: {
      title: { en: 'Why This Project Exists', pt: 'Por Que Este Projeto Existe' },
      p1: {
        en: 'The history of capoeira lives in oral tradition, scattered across personal memories, group websites, books, and academic papers. Too often, this knowledge remains isolated - accessible only to those who know where to look or whom to ask.',
        pt: 'A história da capoeira vive na tradição oral, espalhada por memórias pessoais, sites de grupos, livros e artigos acadêmicos. Muitas vezes, esse conhecimento permanece isolado - acessível apenas para quem sabe onde procurar ou a quem perguntar.',
      },
      p2: {
        en: 'This genealogy project aims to bring together this scattered information into one accessible place, preserving the rich lineages and relationships that connect the capoeira community across generations and continents. It is a service to the community - not a replacement for the living knowledge held by mestres and practitioners.',
        pt: 'Este projeto de genealogia visa reunir essas informações dispersas em um lugar acessível, preservando as ricas linhagens e relacionamentos que conectam a comunidade da capoeira através de gerações e continentes. É um serviço para a comunidade - não uma substituição do conhecimento vivo mantido por mestres e praticantes.',
      },
    },
    methodology: {
      title: { en: 'How the Data Was Compiled', pt: 'Como os Dados Foram Compilados' },
      p1: {
        en: 'We developed an AI-assisted research pipeline to systematically gather and synthesize information from publicly available sources: group websites, academic publications, news articles, interviews, and documented events. Each profile includes bilingual content (Portuguese and English) and citations to its sources.',
        pt: 'Desenvolvemos um pipeline de pesquisa assistido por IA para reunir e sintetizar sistematicamente informações de fontes públicas: sites de grupos, publicações acadêmicas, artigos de notícias, entrevistas e eventos documentados. Cada perfil inclui conteúdo bilíngue (português e inglês) e citações das suas fontes.',
      },
      p2: {
        en: 'We recognize this approach has limitations. AI can consolidate and summarize existing information, but it cannot replace the firsthand knowledge of those who lived this history. Dates may be approximate, relationships may be incomplete, and nuances may be lost. That is why community participation is essential.',
        pt: 'Reconhecemos que essa abordagem tem limitações. A IA pode consolidar e resumir informações existentes, mas não pode substituir o conhecimento em primeira mão daqueles que viveram essa história. Datas podem ser aproximadas, relacionamentos podem estar incompletos e nuances podem ser perdidas. É por isso que a participação da comunidade é essencial.',
      },
    },
    quality: {
      title: { en: 'Data Quality and Accuracy', pt: 'Qualidade e Precisão dos Dados' },
      p1: {
        en: 'We do not claim this data is complete or perfect. Every profile is a starting point, pre-filled with what could be gathered from public sources. We expect - and welcome - corrections.',
        pt: 'Não afirmamos que esses dados são completos ou perfeitos. Cada perfil é um ponto de partida, pré-preenchido com o que foi possível reunir de fontes públicas. Esperamos - e agradecemos - correções.',
      },
      p2: {
        en: 'Each relationship and date in the database includes a confidence level (verified, likely, unverified, or disputed) and precision indicators. This transparency allows users to understand the reliability of the information and identify where improvements are needed.',
        pt: 'Cada relacionamento e data no banco de dados inclui um nível de confiança (verificado, provável, não verificado ou disputado) e indicadores de precisão. Essa transparência permite que os usuários entendam a confiabilidade das informações e identifiquem onde melhorias são necessárias.',
      },
    },
    claiming: {
      title: { en: 'Claiming and Managing Profiles', pt: 'Reivindicação e Gerenciamento de Perfis' },
      p1: {
        en: 'Quilombo app users can request to claim a genealogy profile. Once approved, you become the steward of that profile and can update its information going forward.',
        pt: 'Usuários do aplicativo Quilombo podem solicitar a reivindicação de um perfil de genealogia. Uma vez aprovado, você se torna o guardião desse perfil e pode atualizar suas informações dali em diante.',
      },
      bullets: {
        own: {
          label: { en: 'For your own profile:', pt: 'Para seu próprio perfil:' },
          text: {
            en: 'Claim it to ensure your information is accurate and current.',
            pt: 'Reivindique-o para garantir que suas informações estejam corretas e atualizadas.',
          },
        },
        mestre: {
          label: { en: 'For a mestre or historical figure:', pt: 'Para um mestre ou figura histórica:' },
          text: {
            en: 'Family members or senior students with legitimate interest can apply to manage the profile, preserving the legacy of those who came before.',
            pt: 'Familiares ou alunos seniores com interesse legítimo podem solicitar o gerenciamento do perfil, preservando o legado daqueles que vieram antes.',
          },
        },
        groups: {
          label: { en: 'For groups:', pt: 'Para grupos:' },
          text: {
            en: 'Group leaders or administrators can claim their group profile to keep it updated.',
            pt: 'Líderes ou administradores de grupos podem reivindicar o perfil do grupo para mantê-lo atualizado.',
          },
        },
      },
      p2: {
        en: 'All claim requests are reviewed by administrators to ensure the integrity of the data. This process protects against unauthorized changes while allowing those with genuine connections to contribute.',
        pt: 'Todas as solicitações de reivindicação são revisadas por administradores para garantir a integridade dos dados. Este processo protege contra alterações não autorizadas, permitindo que aqueles com conexões genuínas contribuam.',
      },
    },
    callToAction: {
      en: "This project exists because of the community, for the community. If you see errors or have information to contribute, we want to hear from you. Together, we can build a more complete picture of capoeira's rich heritage.",
      pt: 'Este projeto existe por causa da comunidade, para a comunidade. Se você encontrar erros ou tiver informações para contribuir, queremos ouvir você. Juntos, podemos construir um retrato mais completo da rica herança da capoeira.',
    },
  },
  footer: {
    docsLink: { en: 'Technical Documentation', pt: 'Documentação Técnica' },
    closeButton: { en: 'Close', pt: 'Fechar' },
  },
} as const;

/**
 * Modal explaining the Capoeira Genealogy project - its purpose, methodology, and how users can claim profiles.
 * Designed to address skepticism from established capoeiristas and explain the community-driven approach.
 * Supports bilingual content (English/Portuguese) with a language toggle that syncs with global state.
 */
export function GenealogyInfoModal({ isOpen, onClose }: GenealogyInfoModalProps) {
  const [language, setLanguage] = useAtom(genealogyLanguageAtom);

  const t = CONTENT;

  return (
    <Modal isOpen={isOpen} onClose={onClose} size="2xl" scrollBehavior="inside">
      <ModalContent>
        <ModalHeader className="flex flex-col gap-1 pb-2">
          <div className="flex items-center justify-between pr-8">
            <h3 className="text-xl font-bold">{t.title[language]}</h3>
            <LanguageSwitch language={language} onLanguageChange={setLanguage} />
          </div>
          <p className="text-sm font-normal text-default-500">{t.subtitle[language]}</p>
        </ModalHeader>

        <ModalBody className="gap-6">
          {/* Purpose Section */}
          <section>
            <div className="mb-3 flex items-center gap-2">
              <Users className="h-5 w-5 text-primary" />
              <h4 className="text-lg font-semibold">{t.sections.purpose.title[language]}</h4>
            </div>
            <p className="text-default-600">{t.sections.purpose.p1[language]}</p>
            <p className="mt-2 text-default-600">{t.sections.purpose.p2[language]}</p>
          </section>

          <Divider />

          {/* Methodology Section */}
          <section>
            <div className="mb-3 flex items-center gap-2">
              <BookOpen className="h-5 w-5 text-primary" />
              <h4 className="text-lg font-semibold">{t.sections.methodology.title[language]}</h4>
            </div>
            <p className="text-default-600">{t.sections.methodology.p1[language]}</p>
            <p className="mt-2 text-default-600">
              <strong>
                {language === 'en'
                  ? 'We recognize this approach has limitations.'
                  : 'Reconhecemos que essa abordagem tem limitações.'}
              </strong>{' '}
              {t.sections.methodology.p2[language].replace(
                language === 'en'
                  ? 'We recognize this approach has limitations. '
                  : 'Reconhecemos que essa abordagem tem limitações. ',
                ''
              )}
            </p>
          </section>

          <Divider />

          {/* Data Quality Section */}
          <section>
            <div className="mb-3 flex items-center gap-2">
              <ShieldCheck className="h-5 w-5 text-primary" />
              <h4 className="text-lg font-semibold">{t.sections.quality.title[language]}</h4>
            </div>
            <p className="text-default-600">
              <strong>
                {language === 'en'
                  ? 'We do not claim this data is complete or perfect.'
                  : 'Não afirmamos que esses dados são completos ou perfeitos.'}
              </strong>{' '}
              {t.sections.quality.p1[language].replace(
                language === 'en'
                  ? 'We do not claim this data is complete or perfect. '
                  : 'Não afirmamos que esses dados são completos ou perfeitos. ',
                ''
              )}
            </p>
            <p className="mt-2 text-default-600">{t.sections.quality.p2[language]}</p>
          </section>

          <Divider />

          {/* Claim System Section */}
          <section>
            <div className="mb-3 flex items-center gap-2">
              <GitBranch className="h-5 w-5 text-primary" />
              <h4 className="text-lg font-semibold">{t.sections.claiming.title[language]}</h4>
            </div>
            <p className="text-default-600">{t.sections.claiming.p1[language]}</p>
            <ul className="mt-2 list-inside list-disc space-y-1 text-default-600">
              <li>
                <strong>{t.sections.claiming.bullets.own.label[language]}</strong>{' '}
                {t.sections.claiming.bullets.own.text[language]}
              </li>
              <li>
                <strong>{t.sections.claiming.bullets.mestre.label[language]}</strong>{' '}
                {t.sections.claiming.bullets.mestre.text[language]}
              </li>
              <li>
                <strong>{t.sections.claiming.bullets.groups.label[language]}</strong>{' '}
                {t.sections.claiming.bullets.groups.text[language]}
              </li>
            </ul>
            <p className="mt-2 text-default-600">{t.sections.claiming.p2[language]}</p>
          </section>

          <Divider />

          {/* Call to Action */}
          <section className="rounded-lg bg-default-100 p-4">
            <p className="text-center text-default-700">
              <strong>
                {language === 'en'
                  ? 'This project exists because of the community, for the community.'
                  : 'Este projeto existe por causa da comunidade, para a comunidade.'}
              </strong>
              <br />
              {t.sections.callToAction[language].replace(
                language === 'en'
                  ? 'This project exists because of the community, for the community. '
                  : 'Este projeto existe por causa da comunidade, para a comunidade. ',
                ''
              )}
            </p>
          </section>
        </ModalBody>

        <ModalFooter className="flex-wrap justify-between gap-2">
          <Link
            href={GITHUB_README_URL}
            isExternal
            showAnchorIcon
            className="text-sm"
            color="primary"
            aria-label={
              language === 'en' ? 'View technical documentation on GitHub' : 'Ver documentação técnica no GitHub'
            }
          >
            {t.footer.docsLink[language]}
          </Link>
          <Button color="primary" onPress={onClose}>
            {t.footer.closeButton[language]}
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
}

export default GenealogyInfoModal;
