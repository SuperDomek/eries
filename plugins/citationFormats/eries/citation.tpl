{**
 * plugins/citationFormats/eries/citation.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
* Copyright (c) 2017 Czech University of Life Sciences
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article reading tools -- Capture Citation ERIES format
 *
 *}
{assign var=authors value=$article->getAuthors()}
{assign var=authorCount value=$authors|@count}
{* Retrieve DOI (requires plugin) *}
{foreach from=$pubIdPlugins item=pubIdPlugin}
  {if $pubIdPlugin->getPubIdType() == 'doi'}
    {assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
    {if $pubId}
      {assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
    {/if}
    {php}break;{/php}
  {/if}
{/foreach}
{foreach from=$authors item=author name=authors key=i}
  {$author->getLastName()|escape}, {$author->getFirstName()|escape|substr:0:1}.{if $i==$authorCount-2}; {elseif $i lt $authorCount-1}; {else} {/if}
{/foreach}
{if $issue} ({$issue->getYear()}) {/if}
'{$article->getLocalizedTitle()|strip_unsafe_html|trim}', <em>{$journal->getLocalizedName()|escape}</em> [{translate key="rt.captureCite.online"}],{if $issue}{if $issue->getShowVolume()} vol. {$issue->getVolume()|escape}{/if}{/if}{if $issue && $issue->getShowNumber() && $issue->getNumber()}, no. {$issue->getNumber()}{/if}, pp. {if $article->getPages()}{$article->getPages()}.{else}{translate key="plugins.citationFormats.eries.noPages"}{/if} [Accessed {$smarty.now|date_format:'%e %b. %Y'}]. {if $doiUrl}DOI: <a href="{$doiUrl}">{$doiUrl}</a>{/if}.
