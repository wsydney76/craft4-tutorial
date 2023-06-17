<?php

namespace modules\polyfill;

use Craft;
use Illuminate\Support\Collection;
use modules\polyfill\web\twig\FeExtension;
use yii\base\Module as BaseModule;

/**
 * polyfill module
 *
 * Make the new _globals twig variable introduces in Craft 4.5 available in 4.4
 *
 * @method static Module getInstance()
 */
class Module extends BaseModule
{
    public function init(): void
    {
        Craft::setAlias('@modules/polyfill', __DIR__);

        // Set the controllerNamespace based on whether this is a console or web request
        if (Craft::$app->request->isConsoleRequest) {
            $this->controllerNamespace = 'modules\\polyfill\\console\\controllers';
        } else {
            $this->controllerNamespace = 'modules\\polyfill\\controllers';
        }

        parent::init();

        // Defer most setup tasks until Craft is fully initialized
        Craft::$app->onInit(function() {
            $this->attachEventHandlers();
            // ...
        });
        Craft::$app->view->registerTwigExtension(new FeExtension());
    }

    private function attachEventHandlers(): void
    {
        // Register Collection::set() as an alias of put() - with support for bulk-setting values
        Collection::macro('set', function(mixed $values) {
            /** @var Collection $this */
            if (is_array($values)) {
                foreach ($values as $key => $value) {
                    $this->put($key, $value);
                }
            } else {
                $this->put(...func_get_args());
            }
            return $this;
        });
    }
}
