<?php

namespace modules\polyfill\web\twig;

use Illuminate\Support\Collection;
use Twig\Extension\AbstractExtension;
use Twig\Extension\GlobalsInterface;

/**
 * Twig extension
 */
class FeExtension extends AbstractExtension implements GlobalsInterface
{

    public function getGlobals(): array
    {
        return [
            '_globals' => Collection::make(),
        ];
    }
}
