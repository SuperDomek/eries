<?php

/**
 * @file plugins/citationFormats/eries/EriesCitationPlugin.inc.php
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Copyright (c) 2017 Czech University of Life Sciences
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class EriesCitationPlugin
 * @ingroup plugins_citationFormats_eries
 *
 * @brief eries citation format plugin
 */

import('classes.plugins.CitationPlugin');

class EriesCitationPlugin extends CitationPlugin {
	function register($category, $path) {
		$success = parent::register($category, $path);
		$this->addLocaleData();
		return $success;
	}

	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'EriesCitationPlugin';
	}

	function getDisplayName() {
		return __('plugins.citationFormats.eries.displayName');
	}

	function getCitationFormatName() {
		return __('plugins.citationFormats.eries.citationFormatName');
	}

	function getDescription() {
		return __('plugins.citationFormats.eries.description');
	}

}

?>
