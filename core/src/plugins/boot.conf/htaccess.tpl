<IfModule mod_rewrite.c>
# You must set the correct values here if you want
# to enable webDAV sharing. The values assume that your 
# Pydio installation is at http://yourdomain/
# and that you want the webDAV shares to be accessible via 
# http://yourdomain/shares/repository_id/
RewriteEngine on
RewriteBase ${APPLICATION_ROOT}
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^shares ./dav.php [L]
RewriteRule ^api ./rest.php [L]
RewriteRule ^user ./index.php?get_action=user_access_point [L]
RewriteCond %{REQUEST_URI} !^${APPLICATION_ROOT}/index
RewriteCond %{REQUEST_URI} !^${APPLICATION_ROOT}/plugins
RewriteCond %{REQUEST_URI} ^${APPLICATION_ROOT}/dashboard|^${APPLICATION_ROOT}/settings|^${APPLICATION_ROOT}/welcome|^${APPLICATION_ROOT}/ws-
RewriteRule (.*) index.php [L]

#Following lines seem to be necessary if PHP is working
#with apache as CGI or FCGI. Just remove the #
#See http://doc.tiki.org/WebDAV#Note_about_Apache_with_PHP_as_fcgi_or_cgi

#RewriteCond %{HTTP:Authorization} ^(.*)
#RewriteRule ^(.*) - [E=HTTP_AUTHORIZATION:%1]

#Following lines may be necessary for a PHP-FPM setup
# to make sure that authorization is transmitted.
# Just remove the # at the beginning of the line

#SetEnvIf Authorization "(.*)" HTTP_AUTHORIZATION=$1

</IfModule>

AddType application/json .json