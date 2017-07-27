<?php

/**
 * @defgroup plugins_citationFormats_eries ERIES Citation Format
 */
 
/**
 * @file plugins/citationFormats/eries/index.php
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Copyright (c) 2017 Czech University of Life Sciences
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @ingroup plugins_citationFormats_eries
 * @brief Wrapper for ERIES citation plugin.
 *
 */

require_once('EriesCitationPlugin.inc.php');

return new EriesCitationPlugin();

?>
