<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit8cd493c5bc88e101bd70677e7c5087ca
{
    public static $prefixesPsr0 = array (
        'P' => 
        array (
            'PEAR' => 
            array (
                0 => __DIR__ . '/..' . '/pear/pear_exception',
            ),
        ),
        'C' => 
        array (
            'Console' => 
            array (
                0 => __DIR__ . '/..' . '/pear/console_getopt',
            ),
        ),
        'A' => 
        array (
            'Archive_Tar' => 
            array (
                0 => __DIR__ . '/..' . '/pear/archive_tar',
            ),
        ),
    );

    public static $fallbackDirsPsr0 = array (
        0 => __DIR__ . '/..' . '/pear/pear-core-minimal/src',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixesPsr0 = ComposerStaticInit8cd493c5bc88e101bd70677e7c5087ca::$prefixesPsr0;
            $loader->fallbackDirsPsr0 = ComposerStaticInit8cd493c5bc88e101bd70677e7c5087ca::$fallbackDirsPsr0;

        }, null, ClassLoader::class);
    }
}
