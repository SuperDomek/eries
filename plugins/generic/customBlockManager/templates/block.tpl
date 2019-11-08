{**
 * plugins/generic/customBlockManager/templates/block.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Sidebar custom block.
 *
 *}
<div class="pkp_block block_custom" id="{$customBlockId|escape}">
	<span class="title">{$customBlockName|escape}</span>
	<div class="content">
		{$customBlockContent}
	</div>
</div>