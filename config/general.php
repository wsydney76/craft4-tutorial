<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

use craft\config\GeneralConfig;
use craft\helpers\App;

$cpTrigger = 'admin';
$isCpRequest = str_starts_with($_SERVER['REQUEST_URI'], "/$cpTrigger") || str_starts_with($_GET['p'], $cpTrigger);

$isDev = App::env('CRAFT_ENVIRONMENT') === 'dev';
$isProd = App::env('CRAFT_ENVIRONMENT') === 'production';

return GeneralConfig::create()
    ->pageTrigger('?page=')
	->defaultWeekStartDay(1)
	->omitScriptNameInUrls(true)
	->cpTrigger($cpTrigger)
	->devMode($isDev)
    ->preloadSingles(true)
	->allowAdminChanges($isDev)
	->preventUserEnumeration(true)
	->disallowRobots(!$isProd)
	->maxRevisions(1)
	->convertFilenamesToAscii(true)
	->limitAutoSlugsToAscii(true)
	->generateTransformsBeforePageLoad(!$isCpRequest)
	->optimizeImageFilesize(false)
	->revAssetUrls(true)
    ->transformGifs(false)
    ->transformSvgs(false)
	->enableTemplateCaching($isProd)
	->aliases([
		// Prevent the @web alias from being set automatically (avoid cache poisoning vulnerability)
		'@web' => App::env('PRIMARY_SITE_URL'),

		// Lets `./craft clear-caches all` clear CP resources cache
		'@webroot' => dirname(__DIR__) . '/web',

	]);
