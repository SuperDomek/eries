{**
 * templates/submission/submissionMetadataFormTitleFields.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Submission's metadata form title fields. To be included in any form that wants to handle
 * submission metadata.
 *}
<div class="pkp_helpers_clear">
	{* EDIT removed field prefix*}
	{fbvElement type="hidden" name="prefix" id="prefix" value=$prefix}
	{* EDIT removed size info and inline to keep 100% width*}
	{fbvFormSection for="title" title="common.title" required=true}
		{fbvElement type="text" multilingual=true name="title" id="title" value=$title readonly=$readOnly maxlength="255" required=true}
	{/fbvFormSection}
</div>
{fbvFormSection title="common.subtitle" for="subtitle"}
	{fbvElement label="common.subtitle.tip" type="text" multilingual=true name="subtitle" id="subtitle" value=$subtitle readonly=$readOnly}
{/fbvFormSection}
{fbvFormSection title="common.abstract" for="abstract" required=$abstractsRequired}
	{fbvElement type="textarea" multilingual=true name="abstract" id="abstract" value=$abstract rich="extended" readonly=$readOnly}
{/fbvFormSection}
