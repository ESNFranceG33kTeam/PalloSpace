<?php
/**
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 * @package WordPress
 */

/** SSL conf. Uncomment on production !
*define('FORCE_SSL_ADMIN', true);
*
*if (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {
*	$_SERVER['HTTPS'] = 'on';
*  $_SERVER['SERVER_PORT'] = 443;
*}
*
*if (!empty($_SERVER['HTTP_X_FORWARDED_HOST'])) {
*	$_SERVER['HTTP_HOST'] = $_SERVER['HTTP_X_FORWARDED_HOST'];
*}
*/

/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'pallospace' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'root' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'root' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'host.docker.internal:3306' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'mettez une phrase unique ici' );
define( 'SECURE_AUTH_KEY',  'mettez une phrase unique ici' );
define( 'LOGGED_IN_KEY',    'mettez une phrase unique ici' );
define( 'NONCE_KEY',        'mettez une phrase unique ici' );
define( 'AUTH_SALT',        'mettez une phrase unique ici' );
define( 'SECURE_AUTH_SALT', 'mettez une phrase unique ici' );
define( 'LOGGED_IN_SALT',   'mettez une phrase unique ici' );
define( 'NONCE_SALT',       'mettez une phrase unique ici' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/* Theme par default. */
define( 'WP_DEFAULT_THEME', 'twentytwentytwo' );

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );
