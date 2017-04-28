{**
 * templates/frontend/objects/issue_toc_home.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Copyright (c) 2017 Dominik Bláha
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents for homepage.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $publishedArticles array Lists of articles published in this issue
 *   sorted by section.
 *}
<div class="obj_issue_toc">

	{* Issue introduction area *}
	<div class="heading">

		{* Issue cover image *}
		{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
		{if $issueCover}
      <div class="homepage_image" style="background-image: url('{$issueCover|escape}');">
        <!--<a href="{url op="view" page="issue" path=$issue->getBestIssueId()}"></a>-->
        <div class="issue_overlay">
          {* Title *}
          <div class="current_issue_title">
            {$issue->getIssueIdentification()|strip_unsafe_html}
          </div>

          {* Description *}
          
          {if $issue->hasDescription()}
            <div class="description">
              {$issue->getLocalizedDescription()|strip_unsafe_html}
            </div>
          {/if}
          
          {* Published date *}
          {if $issue->getDatePublished()}
            <div class="published">
              <span class="label">
                {translate key="submissions.published"}:
              </span>
              <span class="value">
                {$issue->getDatePublished()|date_format:$dateFormatShort}
              </span>
            </div>
          {/if}

          {* Full-issue galleys *}
          {if $issueGalleys && $hasAccess}
            <div class="galleys">
              <ul class="galleys_links">
                {foreach from=$issueGalleys item=galley}
                  <li>
                    {include file="frontend/objects/galley_link.tpl" parent=$issue}
                  </li>
                {/foreach}
              </ul>
            </div>
          {/if}

        </div>
      </div>
		{/if}

		
		

		{* PUb IDs (eg - DOI) *}
		{foreach from=$pubIdPlugins item=pubIdPlugin}
			{if $issue->getPublished()}
				{assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
			{else}
				{assign var=pubId value=$pubIdPlugin->getPubId($issue)}{* Preview pubId *}
			{/if}
			{if $pubId}
				{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
				<div class="pub_id {$pubIdPlugin->getPubIdType()|escape}">
					<span class="type">
						{$pubIdPlugin->getPubIdDisplayType()|escape}:
					</span>
					<span class="id">
						{if $doiUrl}
							<a href="{$doiUrl|escape}">
								{$doiUrl}
							</a>
						{else}
							{$pubId}
						{/if}
					</span>
				</div>
			{/if}
		{/foreach}

		
	</div>

	

	{* Articles *}
	<div class="sections">
	{foreach name=sections from=$publishedArticles item=section}
		<div class="section">
		{if $section.articles}
			{if $section.title}
				<h2>
					{$section.title|escape}
				</h2>
			{/if}
			<ul class="articles">
				{foreach from=$section.articles item=article}
					<li>
						{include file="frontend/objects/article_summary.tpl"}
					</li>
				{/foreach}
			</ul>
		{/if}
		</div>
	{/foreach}
	</div><!-- .sections -->
</div>
