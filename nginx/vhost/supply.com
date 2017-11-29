server {
        server_name supply;
        listen       8002;
        root html;

        location / {
            index  index.php index.html;
                root html/supply_web;
        }

        location /supply/ {
            index  index.php index.html;
               if (!-e $request_filename){
                        rewrite /supply/supply/web/(.*)$ /supply/supply/web/index.php?r=$1 last;
              }
        }
        
        
        location ~ \.php{
           fastcgi_pass   127.0.0.1:9000;
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
            include        fastcgi_params;
       }        
}