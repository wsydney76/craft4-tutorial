<?php

namespace craft\contentmigrations;

use Craft;
use craft\db\Migration;
use craft\elements\Entry;
use craft\elements\User;
use craft\helpers\ArrayHelper;

/**
 * m210104_175929_sample_content migration.
 *
 * Adds some bogus content to the project, so you don’t have to!
 */
class m230611_085149_sample_content extends Migration
{


    /**
     * Some fake blog post content we’ll insert into entries.
     *
     * @var array[]
     */
    private $entriesContent = [
        [
            'title' => 'Do These Five Things in an Elevator',
            'slug' => 'five-things-elevator',
            'summary' => 'Must-follow tips for a ride nobody remembers.',
            'bodyContent' => [
                'new1' => [
                    'type' => 'text',
                    'fields' => [
                        'text' => <<<EOT
* Do not scream suddenly.
* Hold anything you’re in the middle of eating until you’ve stepped off the elevator again.
* If you brought any live animals with you, do your best to keep them on your person.
* Avoid vigorous jumping or bouncing.
* Face the same direction as everybody else.
EOT

                    ]
                ]
            ],
        ],
        [
            'title' => 'Use This Trick to Save Money Dining Out',
            'slug' => 'trick-save-money-dining-out',
            'summary' => 'An awesome life hack for lowering your restaurant budget.',
            'bodyContent' => [
                'new1' => [
                    'type' => 'text',
                    'fields' => [
                        'text' => 'Find a recipe for the thing you want and make it at home.'
                    ]
                ]
            ],
        ],
        [
            'title' => 'Don’t Leave Home Without This Quote',
            'slug' => 'dont-leave-home-without-quote',
            'summary' => 'This meditation will prepare you for anything.',
            'bodyContent' => [
                'new1' => [
                    'type' => 'text',
                    'fields' => [
                        'text' => 'Philosopher Jack Handy was known to unpack some of the great complexities of the universe.'
                    ]
                ],
                'new2' => [
                    'type' => 'quote',
                    'fields' => [
                        'text' => 'The face of a child can say it all, especially the mouth part of the face.',
                        'cite' => 'Jack Handy'
                    ]
                ]
            ],
        ]
    ];

    /**
     * @inheritdoc
     */
    public function safeUp(): bool
    {
        return $this->addBlogPosts() &&
            $this->addPostIndex() &&
            $this->addSiteInfoContent();
    }

    /**
     * @inheritdoc
     */
    public function safeDown(): bool
    {
        echo "There is nothing to revert.\n";
        return true;
    }

    /**
     * Add a few fake blog posts.
     *
     * @return bool
     * @throws \Throwable
     * @throws \craft\errors\ElementNotFoundException
     * @throws \yii\base\Exception
     */
    private function addBlogPosts(): bool
    {
        if (!$section = Craft::$app->getSections()->getSectionByHandle('post')) {
            echo 'Blog section does not exist.';
            return false;
        }

        $entryType = $section->getEntryTypes()[0];
        $adminUser = User::find()->admin(true)->one();

        foreach ($this->entriesContent as $i => $entryContent) {
            $entry = new Entry();

            $entry->title = $entryContent['title'];
            $entry->slug = $entryContent['slug'];
            $entry->authorId = $adminUser->id;
            $entry->sectionId = $section->id;
            $entry->typeId = $entryType->id;
            $entry->postDate = (new \DateTime())->modify("-{$i} days");

            $entry->setFieldValues([
                // 'summary' => $entryContent['summary'],
                'bodyContent' => $entryContent['bodyContent'],
            ]);

            Craft::$app->getElements()->saveElement($entry);
        }

        return true;
    }

    /**
     * Add a site intro to the homepage entry.
     *
     * @return bool
     * @throws \Throwable
     * @throws \craft\errors\ElementNotFoundException
     * @throws \yii\base\Exception
     */
    private function addSiteInfoContent(): bool
    {

        if (!$siteInfoEntry = Entry::find()->section('siteInfo')->status(null)->one()) {
            echo 'SiteInfo is missing.';
            return false;
        }

        $siteInfoEntry->setFieldValue('siteName', 'Craft Tutorial');
        $siteInfoEntry->setFieldValue('copyright', 'The Tutorial Inc.');

        if (!Craft::$app->getElements()->saveElement($siteInfoEntry)) {
            echo 'Failed to save site info entry: ' . $siteInfoEntry->getErrors()[0];
            return false;
        }

        return true;
    }

    private function addPostIndex(): bool
    {
        if (!$section = Craft::$app->getSections()->getSectionByHandle('page')) {
            echo 'Page section does not exist.';
            return false;
        }

        $entryType = ArrayHelper::firstWhere($section->getEntryTypes(), 'handle', 'postIndex');
        $adminUser = User::find()->admin(true)->one();

        $entry = new Entry();

        $entry->title = 'Posts';
        $entry->slug = 'posts';
        $entry->authorId = $adminUser->id;
        $entry->sectionId = $section->id;
        $entry->typeId = $entryType->id;
        $entry->siteId = Craft::$app->getSites()->getSiteByHandle('de')->id;

        Craft::$app->getElements()->saveElement($entry);

        $entry = $entry->localized->site('de')->one();
        $entry->title = 'Beiträge';
        $entry->slug = 'beitraege';

        Craft::$app->getElements()->saveElement($entry);

        return true;
    }


}
