# Craft 4 Empty Starter

This is a pure Craft CMS starter as provided in the craftcms/craft package with 
the following additions:

* Added modules/_faux to enable autocompletion for some most frequently used variables in twig
* Moves example module to modules/main
* Set system timezone to Europe/Berlin
* Added /web/cpresources, /node_modules, /config/license.key to .gitignore
* Added more config settings and use fluent syntax in config/general.php
* Added config/redactor/Custom.json as a safe Redactor config
* Added setup/install for automated installation under ddev, creates a user `admin/password`

## DDEV Installation

* Clone repository
* `cd` into project directory
* Run `bash setup/install`

## Install Tailwind CSS (optional)

* `cd` into project directory
* Run `bash setup/install-tailwind`

