import { render } from '@react-email/components';
import type { ReactElement } from 'react';

/**
 * Renders an email template to both HTML and plain text
 * @param template - React email component
 * @returns Object with html and text rendered strings
 */
export async function renderEmailTemplate(template: ReactElement): Promise<{ html: string; text: string }> {
  const html = await render(template);
  const text = await render(template, { plainText: true });
  return { html, text };
}
