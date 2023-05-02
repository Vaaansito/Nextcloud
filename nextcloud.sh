#!/bin/bash

# Changement du depot de package
echo "# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.
deb http://fr.archive.ubuntu.com/ubuntu jammy main restricted
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://fr.archive.ubuntu.com/ubuntu jammy-updates main restricted
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://fr.archive.ubuntu.com/ubuntu jammy universe
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy universe
deb http://fr.archive.ubuntu.com/ubuntu jammy-updates universe
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-updates universe

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team, and may not be under a free licence. Please satisfy yourself as to
## your rights to use the software. Also, please note that software in
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.
deb http://fr.archive.ubuntu.com/ubuntu jammy multiverse
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy multiverse
deb http://fr.archive.ubuntu.com/ubuntu jammy-updates multiverse
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-updates multiverse

## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
deb http://fr.archive.ubuntu.com/ubuntu jammy-backports main restricted universe                                                                                                                                                              multiverse
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-backports main restricted un                                                                                                                                                         iverse multiverse

deb http://fr.archive.ubuntu.com/ubuntu jammy-security main restricted
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-security main restricted
deb http://fr.archive.ubuntu.com/ubuntu jammy-security universe
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-security universe
deb http://fr.archive.ubuntu.com/ubuntu jammy-security multiverse
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-security multiverse" > /etc/apt/sources.list

apt update
apt upgrade
apt-get update

#Solution NGINX
apt install nginx

#Installation de paquets supplémentaires
apt install nano
apt install zip
apt install unzip
apt install rar
apt install unrar
apt install bash-completion
apt install tree
apt install net-tools
apt install curl
apt install openssl
apt install fonts-dejavu
apt install fonts-liberation2
apt install fonts-crosextra-caladea
apt install fonts-crosextra-carlito
apt-get install ttf-mscorefonts-installer
apt-get install p7zip*

#Date et heure
timedatectl set-timezone Europe/Paris

#Solution PHP
apt-get install php-zip php-dom php-xml php-mbstring php-gd php-curl php-cli php8.1-fpm
echo  "; Start a new pool named 'www'.
; the variable $pool can be used in any directive and will be replaced by the
; pool name ('www' here)
[www]

; Per pool prefix
; It only applies on the following directives:
; - 'access.log'
; - 'slowlog'
; - 'listen' (unixsocket)
; - 'chroot'
; - 'chdir'
; - 'php_values'
; - 'php_admin_values'
; When not set, the global prefix (or /usr) applies instead.
; Note: This directive can also be relative to the global prefix.
; Default Value: none
;prefix = /path/to/pools/$pool

; Unix user/group of processes
; Note: The user is mandatory. If the group is not set, the default user's group
;       will be used.
user = www-data
group = www-data

; The address on which to accept FastCGI requests.
; Valid syntaxes are:
;   'ip.add.re.ss:port'    - to listen on a TCP socket to a specific IPv4 address on
;                            a specific port;
;   '[ip:6:addr:ess]:port' - to listen on a TCP socket to a specific IPv6 address on
;                            a specific port;
;   'port'                 - to listen on a TCP socket to all addresses
;                            (IPv6 and IPv4-mapped) on a specific port;
;   '/path/to/unix/socket' - to listen on a unix socket.
; Note: This value is mandatory.
listen = /run/php/php8.1-fpm.sock

; Set listen(2) backlog.
; Default Value: 511 (-1 on FreeBSD and OpenBSD)
;listen.backlog = 511

; Set permissions for unix socket, if one is used. In Linux, read/write
; permissions must be set in order to allow connections from a web server. Many
; BSD-derived systems allow connections regardless of permissions. The owner
; and group can be specified either by name or by their numeric IDs.
; Default Values: user and group are set as the running user
;                 mode is set to 0660
listen.owner = www-data
listen.group = www-data
;listen.mode = 0660
; When POSIX Access Control Lists are supported you can set them using
; these options, value is a comma separated list of user/group names.
; When set, listen.owner and listen.group are ignored
;listen.acl_users =
;listen.acl_groups =

; List of addresses (IPv4/IPv6) of FastCGI clients which are allowed to connect.
; Equivalent to the FCGI_WEB_SERVER_ADDRS environment variable in the original
; PHP FCGI (5.2.2+). Makes sense only with a tcp listening socket. Each address
; must be separated by a comma. If this value is left blank, connections will be
; accepted from any ip address.
; Default Value: any
;listen.allowed_clients = 127.0.0.1

; Specify the nice(2) priority to apply to the pool processes (only if set)
; The value can vary from -19 (highest priority) to 20 (lower priority)
; Note: - It will only work if the FPM master process is launched as root
;       - The pool processes will inherit the master process priority
;         unless it specified otherwise
; Default Value: no set
; process.priority = -19

; Set the process dumpable flag (PR_SET_DUMPABLE prctl) even if the process user
; or group is different than the master process user. It allows to create process
; core dump and ptrace the process for the pool user.
; Default Value: no
; process.dumpable = yes

; Choose how the process manager will control the number of child processes.
; Possible Values:
;   static  - a fixed number (pm.max_children) of child processes;
;   dynamic - the number of child processes are set dynamically based on the
;             following directives. With this process management, there will be
;             always at least 1 children.
;             pm.max_children      - the maximum number of children that can
;                                    be alive at the same time.
;             pm.start_servers     - the number of children created on startup.
;             pm.min_spare_servers - the minimum number of children in 'idle'
;                                    state (waiting to process). If the number
;                                    of 'idle' processes is less than this
;                                    number then some children will be created.
;             pm.max_spare_servers - the maximum number of children in 'idle'
;                                    state (waiting to process). If the number
;                                    of 'idle' processes is greater than this
;                                    number then some children will be killed.
;             pm.max_spawn_rate    - the maximum number of rate to spawn child
;                                    processes at once.
;  ondemand - no children are created at startup. Children will be forked when
;             new requests will connect. The following parameter are used:
;             pm.max_children           - the maximum number of children that
;                                         can be alive at the same time.
;             pm.process_idle_timeout   - The number of seconds after which
;                                         an idle process will be killed.
; Note: This value is mandatory.
pm = dynamic

; The number of child processes to be created when pm is set to 'static' and the
; maximum number of child processes when pm is set to 'dynamic' or 'ondemand'.
; This value sets the limit on the number of simultaneous requests that will be
; served. Equivalent to the ApacheMaxClients directive with mpm_prefork.
; Equivalent to the PHP_FCGI_CHILDREN environment variable in the original PHP
; CGI. The below defaults are based on a server without much resources. Don't
; forget to tweak pm.* to fit your needs.
; Note: Used when pm is set to 'static', 'dynamic' or 'ondemand'
; Note: This value is mandatory.
pm.max_children = 5

; The number of child processes created on startup.
; Note: Used only when pm is set to 'dynamic'
; Default Value: (min_spare_servers + max_spare_servers) / 2
pm.start_servers = 2

; The desired minimum number of idle server processes.
; Note: Used only when pm is set to 'dynamic'
; Note: Mandatory when pm is set to 'dynamic'
pm.min_spare_servers = 1

; The desired maximum number of idle server processes.
; Note: Used only when pm is set to 'dynamic'
; Note: Mandatory when pm is set to 'dynamic'
pm.max_spare_servers = 3

; The number of rate to spawn child processes at once.
; Note: Used only when pm is set to 'dynamic'
; Note: Mandatory when pm is set to 'dynamic'
; Default Value: 32
;pm.max_spawn_rate = 32

; The number of seconds after which an idle process will be killed.
; Note: Used only when pm is set to 'ondemand'
; Default Value: 10s
;pm.process_idle_timeout = 10s;

; The number of requests each child process should execute before respawning.
; This can be useful to work around memory leaks in 3rd party libraries. For
; endless request processing specify '0'. Equivalent to PHP_FCGI_MAX_REQUESTS.
; Default Value: 0
;pm.max_requests = 500

; The URI to view the FPM status page. If this value is not set, no URI will be
; recognized as a status page. It shows the following information:
;   pool                 - the name of the pool;
;   process manager      - static, dynamic or ondemand;
;   start time           - the date and time FPM has started;
;   start since          - number of seconds since FPM has started;
;   accepted conn        - the number of request accepted by the pool;
;   listen queue         - the number of request in the queue of pending
;                          connections (see backlog in listen(2));
;   max listen queue     - the maximum number of requests in the queue
;                          of pending connections since FPM has started;
;   listen queue len     - the size of the socket queue of pending connections;
;   idle processes       - the number of idle processes;
;   active processes     - the number of active processes;
;   total processes      - the number of idle + active processes;
;   max active processes - the maximum number of active processes since FPM
;                          has started;
;   max children reached - number of times, the process limit has been reached,
;                          when pm tries to start more children (works only for
;                          pm 'dynamic' and 'ondemand');
; Value are updated in real time.
; Example output:
;   pool:                 www
;   process manager:      static
;   start time:           01/Jul/2011:17:53:49 +0200
;   start since:          62636
;   accepted conn:        190460
;   listen queue:         0
;   max listen queue:     1
;   listen queue len:     42
;   idle processes:       4
;   active processes:     11
;   total processes:      15
;   max active processes: 12
;   max children reached: 0
;
; By default the status page output is formatted as text/plain. Passing either
; 'html', 'xml' or 'json' in the query string will return the corresponding
; output syntax. Example:
;   http://www.foo.bar/status
;   http://www.foo.bar/status?json
;   http://www.foo.bar/status?html
;   http://www.foo.bar/status?xml
;
; By default the status page only outputs short status. Passing 'full' in the
; query string will also return status for each pool process.
; Example:
;   http://www.foo.bar/status?full
;   http://www.foo.bar/status?json&full
;   http://www.foo.bar/status?html&full
;   http://www.foo.bar/status?xml&full
; The Full status returns for each process:
;   pid                  - the PID of the process;
;   state                - the state of the process (Idle, Running, ...);
;   start time           - the date and time the process has started;
;   start since          - the number of seconds since the process has started;
;   requests             - the number of requests the process has served;
;   request duration     - the duration in µs of the requests;
;   request method       - the request method (GET, POST, ...);
;   request URI          - the request URI with the query string;
;   content length       - the content length of the request (only with POST);
;   user                 - the user (PHP_AUTH_USER) (or '-' if not set);
;   script               - the main script called (or '-' if not set);
;   last request cpu     - the %cpu the last request consumed
;                          it's always 0 if the process is not in Idle state
;                          because CPU calculation is done when the request
;                          processing has terminated;
;   last request memory  - the max amount of memory the last request consumed
;                          it's always 0 if the process is not in Idle state
;                          because memory calculation is done when the request
;                          processing has terminated;
; If the process is in Idle state, then informations are related to the
; last request the process has served. Otherwise informations are related to
; the current request being served.
; Example output:
;   ************************
;   pid:                  31330
;   state:                Running
;   start time:           01/Jul/2011:17:53:49 +0200
;   start since:          63087
;   requests:             12808
;   request duration:     1250261
;   request method:       GET
;   request URI:          /test_mem.php?N=10000
;   content length:       0
;   user:                 -
;   script:               /home/fat/web/docs/php/test_mem.php
;   last request cpu:     0.00
;   last request memory:  0
;
; Note: There is a real-time FPM status monitoring sample web page available
;       It's available in: /usr/share/php/8.1/fpm/status.html
;
; Note: The value must start with a leading slash (/). The value can be
;       anything, but it may not be a good idea to use the .php extension or it
;       may conflict with a real PHP file.
; Default Value: not set
;pm.status_path = /status

; The address on which to accept FastCGI status request. This creates a new
; invisible pool that can handle requests independently. This is useful
; if the main pool is busy with long running requests because it is still possible
; to get the status before finishing the long running requests.
;
; Valid syntaxes are:
;   'ip.add.re.ss:port'    - to listen on a TCP socket to a specific IPv4 address on
;                            a specific port;
;   '[ip:6:addr:ess]:port' - to listen on a TCP socket to a specific IPv6 address on
;                            a specific port;
;   'port'                 - to listen on a TCP socket to all addresses
;                            (IPv6 and IPv4-mapped) on a specific port;
;   '/path/to/unix/socket' - to listen on a unix socket.
; Default Value: value of the listen option
;pm.status_listen = 127.0.0.1:9001

; The ping URI to call the monitoring page of FPM. If this value is not set, no
; URI will be recognized as a ping page. This could be used to test from outside
; that FPM is alive and responding, or to
; - create a graph of FPM availability (rrd or such);
; - remove a server from a group if it is not responding (load balancing);
; - trigger alerts for the operating team (24/7).
; Note: The value must start with a leading slash (/). The value can be
;       anything, but it may not be a good idea to use the .php extension or it
;       may conflict with a real PHP file.
; Default Value: not set
;ping.path = /ping

; This directive may be used to customize the response of a ping request. The
; response is formatted as text/plain with a 200 response code.
; Default Value: pong
;ping.response = pong

; The access log file
; Default: not set
;access.log = log/$pool.access.log

; The access log format.
; The following syntax is allowed
;  %%: the '%' character
;  %C: %CPU used by the request
;      it can accept the following format:
;      - %{user}C for user CPU only
;      - %{system}C for system CPU only
;      - %{total}C  for user + system CPU (default)
;  %d: time taken to serve the request
;      it can accept the following format:
;      - %{seconds}d (default)
;      - %{milliseconds}d
;      - %{milli}d
;      - %{microseconds}d
;      - %{micro}d
;  %e: an environment variable (same as $_ENV or $_SERVER)
;      it must be associated with embraces to specify the name of the env
;      variable. Some examples:
;      - server specifics like: %{REQUEST_METHOD}e or %{SERVER_PROTOCOL}e
;      - HTTP headers like: %{HTTP_HOST}e or %{HTTP_USER_AGENT}e
;  %f: script filename
;  %l: content-length of the request (for POST request only)
;  %m: request method
;  %M: peak of memory allocated by PHP
;      it can accept the following format:
;      - %{bytes}M (default)
;      - %{kilobytes}M
;      - %{kilo}M
;      - %{megabytes}M
;      - %{mega}M
;  %n: pool name
;  %o: output header
;      it must be associated with embraces to specify the name of the header:
;      - %{Content-Type}o
;      - %{X-Powered-By}o
;      - %{Transfert-Encoding}o
;      - ....
;  %p: PID of the child that serviced the request
;  %P: PID of the parent of the child that serviced the request
;  %q: the query string
;  %Q: the '?' character if query string exists
;  %r: the request URI (without the query string, see %q and %Q)
;  %R: remote IP address
;  %s: status (response code)
;  %t: server time the request was received
;      it can accept a strftime(3) format:
;      %d/%b/%Y:%H:%M:%S %z (default)
;      The strftime(3) format must be encapsulated in a %{<strftime_format>}t tag
;      e.g. for a ISO8601 formatted timestring, use: %{%Y-%m-%dT%H:%M:%S%z}t
;  %T: time the log has been written (the request has finished)
;      it can accept a strftime(3) format:
;      %d/%b/%Y:%H:%M:%S %z (default)
;      The strftime(3) format must be encapsulated in a %{<strftime_format>}t tag
;      e.g. for a ISO8601 formatted timestring, use: %{%Y-%m-%dT%H:%M:%S%z}t
;  %u: remote user
;
; Default: "%R - %u %t \"%m %r\" %s"
;access.format = "%R - %u %t \"%m %r%Q%q\" %s %f %{milli}d %{kilo}M %C%%"

; The log file for slow requests
; Default Value: not set
; Note: slowlog is mandatory if request_slowlog_timeout is set
;slowlog = log/$pool.log.slow

; The timeout for serving a single request after which a PHP backtrace will be
; dumped to the 'slowlog' file. A value of '0s' means 'off'.
; Available units: s(econds)(default), m(inutes), h(ours), or d(ays)
; Default Value: 0
;request_slowlog_timeout = 0

; Depth of slow log stack trace.
; Default Value: 20
;request_slowlog_trace_depth = 20

; The timeout for serving a single request after which the worker process will
; be killed. This option should be used when the 'max_execution_time' ini option
; does not stop script execution for some reason. A value of '0' means 'off'.
; Available units: s(econds)(default), m(inutes), h(ours), or d(ays)
; Default Value: 0
;request_terminate_timeout = 0

; The timeout set by 'request_terminate_timeout' ini option is not engaged after                                               
; application calls 'fastcgi_finish_request' or when application has finished and
; shutdown functions are being called (registered via register_shutdown_function).
; This option will enable timeout limit to be applied unconditionally
; even in such cases.
; Default Value: no
;request_terminate_timeout_track_finished = no

; Set open file descriptor rlimit.
; Default Value: system defined value
;rlimit_files = 1024

; Set max core size rlimit.
; Possible Values: 'unlimited' or an integer greater or equal to 0
; Default Value: system defined value
;rlimit_core = 0

; Chroot to this directory at the start. This value must be defined as an
; absolute path. When this value is not set, chroot is not used.
; Note: you can prefix with '$prefix' to chroot to the pool prefix or one
; of its subdirectories. If the pool prefix is not set, the global prefix
; will be used instead.
; Note: chrooting is a great security feature and should be used whenever
;       possible. However, all PHP paths will be relative to the chroot
;       (error_log, sessions.save_path, ...).
; Default Value: not set
;chroot =

; Chdir to this directory at the start.
; Note: relative path can be used.
; Default Value: current directory or / when chroot
;chdir = /var/www

; Redirect worker stdout and stderr into main error log. If not set, stdout and
; stderr will be redirected to /dev/null according to FastCGI specs.
; Note: on highloaded environment, this can cause some delay in the page
; process time (several ms).
; Default Value: no
;catch_workers_output = yes

; Decorate worker output with prefix and suffix containing information about
; the child that writes to the log and if stdout or stderr is used as well as
; log level and time. This options is used only if catch_workers_output is yes.
; Settings to "no" will output data as written to the stdout or stderr.
; Default value: yes
;decorate_workers_output = no

; Clear environment in FPM workers
; Prevents arbitrary environment variables from reaching FPM worker processes
; by clearing the environment in workers before env vars specified in this
; pool configuration are added.
; Setting to "no" will make all environment variables available to PHP code
; via getenv(), $_ENV and $_SERVER.
; Default Value: yes
clear_env = no

; Limits the extensions of the main script FPM will allow to parse. This can
; prevent configuration mistakes on the web server side. You should only limit
; FPM to .php extensions to prevent malicious users to use other extensions to
; execute php code.
; Note: set an empty value to allow all extensions.
; Default Value: .php
;security.limit_extensions = .php .php3 .php4 .php5 .php7

; Pass environment variables like LD_LIBRARY_PATH. All $VARIABLEs are taken from
; the current environment.
; Default Value: clean env
;env[HOSTNAME] = $HOSTNAME
;env[PATH] = /usr/local/bin:/usr/bin:/bin
;env[TMP] = /tmp
;env[TMPDIR] = /tmp
;env[TEMP] = /tmp

; Additional php.ini defines, specific to this pool of workers. These settings
; overwrite the values previously defined in the php.ini. The directives are the
; same as the PHP SAPI:
;   php_value/php_flag             - you can set classic ini defines which can
;                                    be overwritten from PHP call 'ini_set'.
;   php_admin_value/php_admin_flag - these directives won't be overwritten by
;                                     PHP call 'ini_set'
; For php_*flag, valid values are on, off, 1, 0, true, false, yes or no.

; Defining 'extension' will load the corresponding shared extension from
; extension_dir. Defining 'disable_functions' or 'disable_classes' will not
; overwrite previously defined php.ini values, but will append the new value
; instead.

; Note: path INI options can be relative and will be expanded with the prefix
; (pool, global or /usr)

; Default Value: nothing is defined by default except the values in php.ini and
;                specified at startup with the -d argument
;php_admin_value[sendmail_path] = /usr/sbin/sendmail -t -i -f www@my.domain.com
;php_flag[display_errors] = off
;php_admin_value[error_log] = /var/log/fpm-php.www.log
;php_admin_flag[log_errors] = on
;php_admin_value[memory_limit] = 512M"  > /etc/php/8.1/fpm/pool.d/www.conf

systemctl reload-or-restart php8.1-fpm

#Solution MariaDB

apt install mariadb-client mariadb-server php-mysql

confirmation="N"

while [ "$confirmation" != "O" ] && [ "$confirmation" != "o" ]
do
    #Saisie des variables
    echo "Entrez l'utilisateur de la base de données : "
    read BDD_UTILISATEUR

    echo "Entrez le mot de passe de la base de données : "
    read BDD_MDP

    echo "Entrez le nom de la base de données : "
    read BDD_NOM

    # Affichage des variables
    echo "Vous avez entré les informations suivantes :"
    echo "- Utilisateur de la base de données : $BDD_UTILISATEUR"
    echo "- Mot de passe de la base de données : $BDD_MDP"
    echo "- Nom de la base de données : $BDD_NOM"

    # Confirmation
    echo "Confirmez-vous que ces informations sont correctes ? (O/N)"
    read confirmation
done

mysql -u root -p -e "CREATE USER '$BDD_UTILISATEUR'@'localhost' IDENTIFIED BY '$BDD_MDP';"
mysql -u root -p -e "CREATE DATABASE $BDD_NOM DEFAULT CHARSET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON $BDD_NOM.* TO '$BDD_UTILISATEUR'@'localhost';"
mysql -u root -p -e "FLUSH PRIVILEGES;"


#Installation de Nextcloud

confirmation="N"

while [ "$confirmation" != "O" ] && [ "$confirmation" != "o" ]
do
    echo "Entrez la version de Nextcloud a installer (FORMAT -> X.X.X) :"
    read VERSION

    echo "Vous avez saisie la version suivante : $VERSION"

    echo "Confirmez-vous que cette version est la bonne ? (O/N)"
    read confirmation
done

wget -p /var/www https://download.nextcloud.com/server/releases/nextcloud-$VERSION.zip
unzip /var/www/nextcloud-$VERSION.zip -d /var/www/

chown -R www-data:www-data /var/www/nextcloud


confirmation="N"

while [ "$confirmation" != "O" ] && [ "$confirmation" != "o" ]
do
    echo "Entrez le nom d'utilisateur :"
    read UTILISATEUR

    echo "Entrez le mot de passe de cet utilisateur :"
    read MDP

    echo "Vous avez saisi les informations suivantes :"
    echo "- Utilisateur : $UTILISATEUR"
    echo "- Mot de passe : $UTILISATEUR_MDP"

    echo "Confirmez-vous que ces informations sont correctes ? (O/N)"
    read confirmation
done

mkdir -p /home/$UTILISATEUR/nextcloud/data
chown -R www-data:www-data /home/$UTILISATEUR/nextcloud/
chmod 775 /home/$UTILISATEUR

sudo -u www-data php /var/www/nextcloud/occ maintenance:install --database=mysql --database-name=$BDD_NOM --database-user=$BDD_UTILISATEUR --database-pass=$BDD_MDP --admin-user=$UTILISATEUR --admin-pass=$UTILISATEUR_MDP --admin-email=technique@synergy83.fr --data-dir=/home/$UTILISATEUR/nextcloud/data/


confirmation="N"

while [ "$confirmation" != "O" ] && [ "$confirmation" != "o" ]
do
    echo "Entrez l'adresse IP :"
    read IP

    echo "Vous avez saisi l'adresse IP suivante : $IP"

    echo "Confirmez-vous que cette adresse IP est correcte ? (O/N)"
    read confirmation
done

sudo -u www-data php /var/www/nextcloud/occ config:system:set overwrite.cli.url --value http://$IP
sudo -u www-data php /var/www/nextcloud/occ config:system:set trusted_domains 1 --value $IP

wget -O /etc/nginx/sites-available/$IP.conf https://raw.githubusercontent.com/nextcloud/documentation/c724e53f74ede5b2f8e58a3590461b11cc48fc6c/admin_manual/installation/nginx-root.conf.sample

ln -s /etc/nginx/sites-available/$IP.conf /$IP.conf

#Cron

apt install cron

sudo -u www-data crontab -l | { cat; echo "*/5 * * * * php -f /var/www/nextcloud/cron.php > /home/$UTILISATEUR/nextcloud/data/cron.log"; } | sudo -u www-data crontab -

sudo -u www-data php /var/www/nextcloud/occ config:system:set default_phone_region --value FR

#Configuration NGINX (pas terminee)

apt install certbot python3-certbot-nginx

#Configuration des couches application (pas terminee)

wget -O /var/nextcloud.asc https://download.nextcloud.com/server/releases/$VERSION.tar.bz2.asc
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0C54D189F4BA284D
echo "deb https://www.collaboraoffice.com/repos/CollaboraOnline/CODE-ubuntu2204 ./ " > /etc/apt/sources.list.d/collabora.list
apt update
apt install coolwsd code-brand

systemctl stop coolwsd
touch /var/log/coolwsd.log
chown cool:cool /var/log/coolwsd.log

echo  "<!-- -*- nxml-child-indent: 4; tab-width: 4; indent-tabs-mode: nil -*- -->
<config>

    <!-- For more detailed documentation on typical configuration options please see:
         https://sdk.collaboraonline.com/docs/installation/Configuration.html -->

    <!-- Note: 'default' attributes are used to document a setting's default value as well as to use as fallback. -->
    <!-- Note: When adding a new entry, a default must be set in WSD in case the entry is missing upon deployment. -->

    <allowed_languages desc="List of supported languages of Writing Aids (spell checker, grammar checker, thesaurus, hyphenation) on this instance. Allowing too many has negative effect on startup performance." default="de_DE en_GB en_US es_ES fr_FR it nl pt_BR pt_PT ru">de_DE en_GB en_US es_ES fr_FR it nl pt_BR pt_PT ru</allowed_languages>

    <!--
        This is LanguageTool.org API settings. To turn it on, please set "enabled" property to true.
        "base_url" may be https://api.languagetoolplus.com/v2 if the cloud version is used.
        However, your data in the document e.g. the text part of it will be sent to the cloud API. Please read the privacy policy: https://languagetool.org/legal/privacy
    -->
    <languagetool desc="LanguageTool Remote API settings for grammar checking">
        <enabled desc="Enable LanguageTool Remote Grammar Checker" type="bool" default="false"></enabled>
        <base_url desc="Http endpoint for the LanguageTool API server, without /check or /languages postfix at the end." type="string" default=""></base_url>
        <user_name desc="LanguageTool account username for premium usage." type="string" default=""></user_name>
        <api_key desc="Api key provided by LanguageTool account for premium usage." type="string" default=""></api_key>
        <ssl_verification desc="Enable or disable SSL verification" type="string" default="true"></ssl_verification>
    </languagetool>

    <deepl desc="DeepL API settings for translation service">
        <enabled desc="If true, shows translate option as a menu entry in the compact view and as an icon in the tabbed view." type="bool" default="false">false</enabled>
        <api_url desc="URL for the API" type="string" default=""></api_url>
        <auth_key desc="Auth Key generated by your account" type="string" default=""></auth_key>
    </deepl>

    <sys_template_path desc="Path to a template tree with shared libraries etc to be used as source for chroot jails for child processes." type="path" relative="true" default="systemplate"></sys_template_path>
    <child_root_path desc="Path to the directory under which the chroot jails for the child processes will be created. Should be on the same file system as systemplate and lotemplate. Must be an empty directory." type="path" relative="true" default="jails"></child_root_path>
    <mount_jail_tree desc="Controls whether the systemplate and lotemplate contents are mounted or not, which is much faster than the default of linking/copying each file." type="bool" default="true"></mount_jail_tree>

    <server_name desc="External hostname:port of the server running coolwsd. If empty, it's derived from the request (please set it if this doesn't work). May be specified when behind a reverse-proxy or when the hostname is not reachable directly." type="string" default=""></server_name>
    <file_server_root_path desc="Path to the directory that should be considered root for the file server. This should be the directory containing cool." type="path" relative="true" default="browser/../"></file_server_root_path>
    <hexify_embedded_urls desc="Enable to protect encoded URLs from getting decoded by intermediate hops. Particularly useful on Azure deployments" type="bool" default="false"></hexify_embedded_urls>
    <experimental_features desc="Enable/Disable experimental features" type="bool" default="true">true</experimental_features>

    <memproportion desc="The maximum percentage of system memory consumed by all of the Collabora Online Development Edition, after which we start cleaning up idle documents" type="double" default="80.0"></memproportion>
    <num_prespawn_children desc="Number of child processes to keep started in advance and waiting for new clients." type="uint" default="1">1</num_prespawn_children>
    <!-- <fetch_update_check desc="Every number of hours will fetch latest version data. Defaults to 10 hours." type="uint" default="10">10</fetch_update_check> -->
    <per_document desc="Document-specific settings, including LO Core settings.">
        <max_concurrency desc="The maximum number of threads to use while processing a document." type="uint" default="4">4</max_concurrency>
        <batch_priority desc="A (lower) priority for use by batch eg. convert-to processes to avoid starving interactive ones" type="uint" default="5">5</batch_priority>
        <document_signing_url desc="The endpoint URL of signing server, if empty the document signing is disabled" type="string" default=""></document_signing_url>
        <redlining_as_comments desc="If true show red-lines as comments" type="bool" default="false">false</redlining_as_comments>
        <pdf_resolution_dpi desc="The resolution, in DPI, used to render PDF documents as image. Memory consumption grows proportionally. Must be a positive value less than 385. Defaults to 96." type="uint" default="96">96</pdf_resolution_dpi>
        <idle_timeout_secs desc="The maximum number of seconds before unloading an idle document. Defaults to 1 hour." type="uint" default="3600">3600</idle_timeout_secs>
        <idlesave_duration_secs desc="The number of idle seconds after which document, if modified, should be saved. Disabled when 0. Defaults to 30 seconds." type="uint" default="30">30</idlesave_duration_secs>
        <autosave_duration_secs desc="The number of seconds after which document, if modified, should be saved. Disabled when 0. Defaults to 5 minutes." type="uint" default="300">300</autosave_duration_secs>
        <always_save_on_exit desc="On exiting the last editor, always perform the save, even if the document is not modified." type="bool" default="false">false</always_save_on_exit>
        <limit_virt_mem_mb desc="The maximum virtual memory allowed to each document process. 0 for unlimited." type="uint">0</limit_virt_mem_mb>
        <limit_stack_mem_kb desc="The maximum stack size allowed to each document process. 0 for unlimited." type="uint">8000</limit_stack_mem_kb>
        <limit_file_size_mb desc="The maximum file size allowed to each document process to write. 0 for unlimited." type="uint">0</limit_file_size_mb>
        <limit_num_open_files desc="The maximum number of files allowed to each document process to open. 0 for unlimited." type="uint">0</limit_num_open_files>
        <limit_load_secs desc="Maximum number of seconds to wait for a document load to succeed. 0 for unlimited." type="uint" default="100">100</limit_load_secs>
        <limit_store_failures desc="Maximum number of consecutive save-and-upload to storage failures when unloading the document. 0 for unlimited (not recommended)." type="uint" default="5">5</limit_store_failures>
        <limit_convert_secs desc="Maximum number of seconds to wait for a document conversion to succeed. 0 for unlimited." type="uint" default="100">100</limit_convert_secs>
        <min_time_between_saves_ms desc="Minimum number of milliseconds between saving the document on disk." type="uint" default="500">500</min_time_between_saves_ms>
        <min_time_between_uploads_ms desc="Minimum number of milliseconds between uploading the document to storage." type="uint" default="5000">5000</min_time_between_uploads_ms>
        <cleanup desc="Checks for resource consuming (bad) documents and kills associated kit process. A document is considered resource consuming (bad) if is in idle state for idle_time_secs period and memory usage passed limit_dirty_mem_mb or CPU usage passed limit_cpu_per" enable="true">
            <cleanup_interval_ms desc="Interval between two checks" type="uint" default="10000">10000</cleanup_interval_ms>
            <bad_behavior_period_secs desc="Minimum time period for a document to be in bad state before associated kit process is killed. If in this period the condition for bad document is not met once then this period is reset" type="uint" default="60">60</bad_behavior_period_secs>
            <idle_time_secs desc="Minimum idle time for a document to be candidate for bad state" type="uint" default="300">300</idle_time_secs>
            <limit_dirty_mem_mb desc="Minimum memory usage for a document to be candidate for bad state" type="uint" default="3072">3072</limit_dirty_mem_mb>
            <limit_cpu_per desc="Minimum CPU usage for a document to be candidate for bad state" type="uint" default="85">85</limit_cpu_per>
            <lost_kit_grace_period_secs desc="The minimum grace period for a lost kit process (not referenced by coolwsd) to resolve its lost status before it is terminated. To disable the cleanup of lost kits use value 0" default="120">120</lost_kit_grace_period_secs>
        </cleanup>
    </per_document>

    <per_view desc="View-specific settings.">
        <group_download_as desc="If set to true, groups download as icons into a dropdown for the notebookbar view." type="bool" default="true">true</group_download_as>
        <out_of_focus_timeout_secs desc="The maximum number of seconds before dimming and stopping updates when the browser tab is no longer in focus. Defaults to 120 seconds." type="uint" default="120">120</out_of_focus_timeout_secs>
        <idle_timeout_secs desc="The maximum number of seconds before dimming and stopping updates when the user is no longer active (even if the browser is in focus). Defaults to 15 minutes." type="uint" default="900">900</idle_timeout_secs>
    </per_view>

    <ver_suffix desc="Appended to etags to allow easy refresh of changed files during development" type="string" default=""></ver_suffix>

    <logging>
        <color type="bool">true</color>
        <!--
             Note to developers: When you do "make run", the logging.level will be set on the
             coolwsd command line, so if you want to change it for your testing, do it in
             Makefile.am, not here.
        -->
        <level type="string" desc="Can be 0-8 (with the lowest numbers being the least verbose), or none (turns off logging), fatal, critical, error, warning, notice, information, debug, trace" default="warning">warning</level>
        <level_startup type="string" desc="As for level - but for the initial startup phase which is most problematic, logging reverts to level configured above when startup is complete" default="trace">trace</level_startup>
        <most_verbose_level_settable_from_client type="string" desc="A loggingleveloverride message from the client can not set a more verbose log level than this" default="notice">notice</most_verbose_level_settable_from_client>
        <least_verbose_level_settable_from_client type="string" desc="A loggingleveloverride message from a client can not set a less verbose log level than this" default="fatal">fatal</least_verbose_level_settable_from_client>
        <protocol type="bool" desc="Enable minimal client-site JS protocol logging from the start">false</protocol>
        <!-- lokit_sal_log example: Log WebDAV-related messages, that is interesting for debugging Insert - Image operation: "+TIMESTAMP+INFO.ucb.ucp.webdav+WARN.ucb.ucp.webdav"
             See also: https://docs.libreoffice.org/sal/html/sal_log.html -->
        <lokit_sal_log type="string" desc="Fine tune log messages from LOKit. Default is to suppress log messages from LOKit." default="-INFO-WARN">-INFO-WARN</lokit_sal_log>
        <file enable="true">
            <!-- If you use other path than /var/log and you run coolwsd from systemd, make sure that you enable that path in coolwsd.service (ReadWritePaths). -->
            <property name="path" desc="Log file path.">/var/log/coolwsd.log</property>
            <property name="rotation" desc="Log file rotation strategy. See Poco FileChannel.">monthly</property>
            <property name="archive" desc="Append either timestamp or number to the archived log filename.">timestamp</property>
            <property name="compress" desc="Enable/disable log file compression.">true</property>
            <property name="purgeAge" desc="The maximum age of log files to preserve. See Poco FileChannel.">366 days</property>
            <property name="purgeCount" desc="The maximum number of log archives to preserve. Use 'none' to disable purging. See Poco FileChannel.">12</property>
            <property name="rotateOnOpen" desc="Enable/disable log file rotation on opening.">true</property>
            <property name="flush" desc="Enable/disable flushing after logging each line. May harm performance. Note that without flushing after each line, the log lines from the different processes will not appear in chronological order.">false</property>
        </file>
        <anonymize>
            <anonymize_user_data type="bool" desc="Enable to anonymize/obfuscate of user-data in logs. If default is true, it was forced at compile-time and cannot be disabled." default="false">false</anonymize_user_data>
            <anonymization_salt type="uint" desc="The salt used to anonymize/obfuscate user-data in logs. Use a secret 64-bit random number." default="82589933">82589933</anonymization_salt>
        </anonymize>
        <docstats type="bool" desc="Enable to see document handling information in logs." default="false">false</docstats>
        <userstats desc="Enable user stats. i.e: logs the details of a file and user" type="bool" default="false">false</userstats>
    </logging>

    <!--
         Note to developers: When you do "make run", the trace_event[@enable] will be set on the
         coolwsd command line, so if you want to change it for your testing, do it in Makefile.am,
         not here.
    -->
    <trace_event desc="The possibility to turn on generation of a Chrome Trace Event file" enable="false">
        <path desc="Output path for the Trace Event file, to which they will be written if turned on at run-time" type="string" default="/var/log/coolwsd.trace.json">/var/log/coolwsd.trace.json</path>
    </trace_event>

    <browser_logging desc="Logging in the browser console" default="false">false</browser_logging>

    <trace desc="Dump commands and notifications for replay. When 'snapshot' is true, the source file is copied to the path first." enable="false">
        <path desc="Output path to hold trace file and docs. Use '%' for timestamp to avoid overwriting. For example: /some/path/to/cooltrace-%.gz" compress="true" snapshot="false"></path>
        <filter>
            <message desc="Regex pattern of messages to exclude"></message>
        </filter>
        <outgoing>
            <record desc="Whether or not to record outgoing messages" default="false">false</record>
        </outgoing>
    </trace>

    <net desc="Network settings">
      <!-- On systems where localhost resolves to IPv6 [::1] address first, when net.proto is all and net.listen is loopback, coolwsd unexpectedly listens on [::1] only.
           You need to change net.proto to IPv4, if you want to use 127.0.0.1. -->
      <proto type="string" default="all" desc="Protocol to use IPv4, IPv6 or all for both">IPv4</proto>
      <listen type="string" default="any" desc="Listen address that coolwsd binds to. Can be 'any' or 'loopback'.">loopback</listen>
      <!-- this allows you to shift all of our URLs into a sub-path from
           https://my.com/browser/a123... to https://my.com/my/sub/path/browser/a123... -->
      <service_root type="path" default="" desc="Prefix all the pages, websockets, etc. with this path."></service_root>
      <post_allow desc="Allow/deny client IP address for POST(REST)." allow="true">
        <host desc="The IPv4 private 192.168 block as plain IPv4 dotted decimal addresses.">192\.168\.[0-9]{1,3}\.[0-9]{1,3}</host>
        <host desc="Ditto, but as IPv4-mapped IPv6 addresses">::ffff:192\.168\.[0-9]{1,3}\.[0-9]{1,3}</host>
        <host desc="The IPv4 loopback (localhost) address.">127\.0\.0\.1</host>
        <host desc="Ditto, but as IPv4-mapped IPv6 address">::ffff:127\.0\.0\.1</host>
        <host desc="The IPv6 loopback (localhost) address.">::1</host>
        <host desc="The IPv4 private 172.16.0.0/12 subnet part 1.">172\.1[6789]\.[0-9]{1,3}\.[0-9]{1,3}</host>
        <host desc="Ditto, but as IPv4-mapped IPv6 addresses">::ffff:172\.1[6789]\.[0-9]{1,3}\.[0-9]{1,3}</host>
        <host desc="The IPv4 private 172.16.0.0/12 subnet part 2.">172\.2[0-9]\.[0-9]{1,3}\.[0-9]{1,3}</host>
        <host desc="Ditto, but as IPv4-mapped IPv6 addresses">::ffff:172\.2[0-9]\.[0-9]{1,3}\.[0-9]{1,3}</host>
        <host desc="The IPv4 private 172.16.0.0/12 subnet part 3.">172\.3[01]\.[0-9]{1,3}\.[0-9]{1,3}</host>
        <host desc="Ditto, but as IPv4-mapped IPv6 addresses">::ffff:172\.3[01]\.[0-9]{1,3}\.[0-9]{1,3}</host>
        <host desc="The IPv4 private 10.0.0.0/8 subnet (Podman).">10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}</host>
        <host desc="Ditto, but as IPv4-mapped IPv6 addresses">::ffff:10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}</host>
      </post_allow>
      <frame_ancestors desc="Specify who is allowed to embed the Collabora Online iframe (coolwsd and WOPI host are always allowed). Separate multiple hosts by space."></frame_ancestors>
      <connection_timeout_secs desc="Specifies the connection, send, recv timeout in seconds for connections initiated by coolwsd (such as WOPI connections)." type="int" default="30"></connection_timeout_secs>

      <!-- this setting radically changes how online works, it should not be used in a production environment -->
      <proxy_prefix type="bool" default="false" desc="Enable a ProxyPrefix to be passed int through which to redirect requests"></proxy_prefix>
    </net>

    <ssl desc="SSL settings">
        <!-- switches from https:// + wss:// to http:// + ws:// -->
        <enable type="bool" desc="Controls whether SSL encryption between coolwsd and the network is enabled (do not disable for production deployment). If default is false, must first be compiled with SSL support to enable." default="true">false</enable>
        <!-- SSL off-load can be done in a proxy, if so disable SSL, and enable termination below in production -->
        <termination desc="Connection via proxy where coolwsd acts as working via https, but actually uses http." type="bool" default="true">true</termination>
        <cert_file_path desc="Path to the cert file" relative="false">/etc/coolwsd/cert.pem</cert_file_path>
        <key_file_path desc="Path to the key file" relative="false">/etc/coolwsd/key.pem</key_file_path>
        <ca_file_path desc="Path to the ca file" relative="false">/etc/coolwsd/ca-chain.cert.pem</ca_file_path>
        <cipher_list desc="List of OpenSSL ciphers to accept" default="ALL:!ADH:!LOW:!EXP:!MD5:@STRENGTH"></cipher_list>
        <hpkp desc="Enable HTTP Public key pinning" enable="false" report_only="false">
            <max_age desc="HPKP's max-age directive - time in seconds browser should remember the pins" enable="true">1000</max_age>
            <report_uri desc="HPKP's report-uri directive - pin validation failure are reported at this URL" enable="false"></report_uri>
            <pins desc="Base64 encoded SPKI fingerprints of keys to be pinned">
            <pin></pin>
            </pins>
        </hpkp>
        <sts desc="Strict-Transport-Security settings, per rfc6797. Subdomains are always included.">
            <enabled desc="Whether or not Strict-Transport-Security is enabled. Enable only when ready for production. Cannot be disabled without resetting the browsers." type="bool" default="false">false</enabled>
            <max_age desc="Strict-Transport-Security max-age directive, in seconds. 0 is allowed; please see rfc6797 for details. Defaults to 1 year." type="int" default="31536000">31536000</max_age>
        </sts>
    </ssl>

    <security desc="Altering these defaults potentially opens you to significant risk">
      <seccomp desc="Should we use the seccomp system call filtering." type="bool" default="true">true</seccomp>
      <capabilities desc="Should we require capabilities to isolate processes into chroot jails" type="bool" default="true">true</capabilities>
      <jwt_expiry_secs desc="Time in seconds before the Admin Console's JWT token expires" type="int" default="1800">1800</jwt_expiry_secs>
      <enable_macros_execution desc="Specifies whether the macro execution is enabled in general. This will enable Basic, Beanshell, Javascript and Python scripts. If it is set to false, the macro_security_level is ignored. If it is set to true, the mentioned entry specified the level of macro security." type="bool" default="false">false</enable_macros_execution>
      <macro_security_level desc="Level of Macro security. 1 (Medium) Confirmation required before executing macros from untrusted sources. 0 (Low, not recommended) All macros will be executed without confirmation." type="int" default="1">1</macro_security_level>
      <enable_metrics_unauthenticated desc="When enabled, the /cool/getMetrics endpoint will not require authentication." type="bool" default="false">false</enable_metrics_unauthenticated>
    </security>

    <certificates>
      <database_path type="string" desc="Path to the NSS certificates that are used for signing documents" default=""></database_path>
    </certificates>

    <watermark>
      <opacity desc="Opacity of on-screen watermark from 0.0 to 1.0" type="double" default="0.2"></opacity>
      <text desc="Watermark text to be displayed on the document if entered" type="string"></text>
    </watermark>


    <user_interface>
      <mode type="string" desc="Controls the user interface style. The 'default' means: Take the value from ui_defaults, or decide for one of compact or tabbed (default|compact|tabbed)" default="default">default</mode>
      <use_integration_theme desc="Use theme from the integrator" type="bool" default="true">true</use_integration_theme>
    </user_interface>

    <storage desc="Backend storage">
        <filesystem allow="false" />
        <wopi desc="Allow/deny wopi storage." allow="true">
            <max_file_size desc="Maximum document size in bytes to load. 0 for unlimited." type="uint">0</max_file_size>
            <locking desc="Locking settings">
                <refresh desc="How frequently we should re-acquire a lock with the storage server, in seconds (default 15 mins) or 0 for no refresh" type="int" default="900">900</refresh>
            </locking>

            <alias_groups desc="default mode is 'first' it allows only the first host when groups are not defined. set mode to 'groups' and define group to allow multiple host and its aliases" mode="first">
            <!-- If you need to use multiple wopi hosts, please change the mode to "groups" and
                    add the hosts below.  If one host is accessible under multiple ip addresses
                    or names, add them as aliases. -->
            <!--<group>
                    <host desc="hostname to allow or deny." allow="true">scheme://hostname:port</host>
                    <alias desc="regex pattern of aliasname">scheme://aliasname1:port</alias>
                    <alias desc="regex pattern of aliasname">scheme://aliasname2:port</alias>

            </group>-->
            <!-- More "group"s possible here -->
            </alias_groups>

        </wopi>
        <ssl desc="SSL settings">
            <as_scheme type="bool" default="true" desc="When set we exclusively use the WOPI URI's scheme to enable SSL for storage">true</as_scheme>
            <enable type="bool" desc="If as_scheme is false or not set, this can be set to force SSL encryption between storage and coolwsd. When empty this defaults to following the ssl.enable setting"></enable>
            <cert_file_path desc="Path to the cert file" relative="false"></cert_file_path>
            <key_file_path desc="Path to the key file" relative="false"></key_file_path>
            <ca_file_path desc="Path to the ca file. If this is not empty, then SSL verification will be strict, otherwise cert of storage (WOPI-like host) will not be verified." relative="false"></ca_file_path>
            <cipher_list desc="List of OpenSSL ciphers to accept. If empty the defaults are used. These can be overridden only if absolutely needed."></cipher_list>
        </ssl>
    </storage>

    <tile_cache_persistent desc="Should the tiles persist between two editing sessions of the given document?" type="bool" default="true">true</tile_cache_persistent>

    <admin_console desc="Web admin console settings.">
        <enable desc="Enable the admin console functionality" type="bool" default="true">true</enable>
        <enable_pam desc="Enable admin user authentication with PAM" type="bool" default="false">false</enable_pam>
        <username desc="The username of the admin console. Ignored if PAM is enabled."></username>
        <password desc="The password of the admin console. Deprecated on most platforms. Instead, use PAM or coolconfig to set up a secure password."></password>
    </admin_console>

    <monitors desc="Addresses of servers we connect to on start for monitoring">
    </monitors>

    <quarantine_files desc="Files are stored here to be examined later in cases of crashes or similar situation." default="false" enable="false">
        <limit_dir_size_mb desc="Maximum directory size. On exceeding the specified limit, older files will be deleted." default="250" type="uint"></limit_dir_size_mb>
        <max_versions_to_maintain desc="How many versions of the same file to keep." default="2" type="uint"></max_versions_to_maintain>
        <path desc="Path to directory under which quarantined files will be stored" type="path" relative="true" default="quarantine"></path>
        <expiry_min desc="Time in mins after quarantined files will be deleted." type="int" default="30"></expiry_min>
    </quarantine_files>

    <remote_config>
        <remote_url desc="remote server to which you will send resquest to get remote config in response" type="string" default=""></remote_url>
    </remote_config>

    <remote_font_config>
        <url desc="URL of optional JSON file that lists fonts to be included in Online" type="string" default=""></url>
    </remote_font_config>

    <home_mode>
        <enable desc="Enable more configuration options for home users" type="bool" default="false">false</enable>
    </home_mode>

    <fonts_missing>
        <handling desc="How to handle fonts mising in a document: 'report', 'log', 'both', or 'ignore'" type="string" default="log">log</handling>
    </fonts_missing>

</config>" > /etc/coolwsd/coolwsd.xml

apt-get install collaboraoffice*-fr

systemctl start coolwsd

#Installation du module de recherche(pas terminee)

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
apt update
apt install elasticsearch
systemctl enable elasticsearch
systemctl start elasticsearch
