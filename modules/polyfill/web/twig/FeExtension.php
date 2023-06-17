<?php

namespace modules\polyfill\web\twig;

use Craft;
use Illuminate\Support\Collection;
use Twig\Extension\AbstractExtension;
use Twig\Extension\GlobalsInterface;
use Twig\TwigFilter;
use Twig\TwigFunction;
use Twig\TwigTest;

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
