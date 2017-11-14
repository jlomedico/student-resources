```sh
heroku help                      # Show heroku command help

# creating apps
heroku create                    # Creates an app on Heroku.
heroku create oh-new-app-name    # Create an app on Heroku with a particular name (no under_scores allowed)

# managing an app
heroku info                         # show app info, like web url and git repo  
heroku open                         # open the app in a web browser  
heroku rename <newname>             # rename the app  
heroku restart                      # restart an app

# running code in your app
heroku rake <command>               # remotely execute a rake command  
heroku console <command>            # remotely execute a single console command  
heroku console                      # start an interactive console to the remote app  
heroku run bash    
heroku run console                  # Rails console  

# viewing logs
heroku logs  
heroku logs -t      # --tail (stream)  
heroku logs -s app  # --source (only on app logs)  

# managing apps
heroku list                      # Get a list of all of your Heroku apps

# managing collaborators  
heroku access                            # List all collaborators
heroku access:add me@this_domain.com    
heroku access:remove me@this_domain.com    
  
# transfer app ownership to another user  
heroku sharing:transfer new@owner.com    
    
# managing ssh keys  
heroku keys                         # show your user's public keys  
heroku keys:add [<path to keyfile>] # add a public key  
heroku keys:remove <keyname>        # remove a key by name (user@host)  
heroku keys:clear                   # remove all keys  
  
# manging app domains  
heroku domains:add <domain>         # add a custom domain name  
heroku domains:remove <domain>      # remove a custom domain name  
heroku domains:clear                # remove all custom domains  
 
# change maintenance status 
heroku maintenance:on               # put the app into maintenance mode   
heroku maintenance:off              # take the app out of maintenance mode   
  
# app configuration 
heroku config                       # display the app's config vars (environment)   
heroku config:add key=val [...]     # add one or more config vars   
heroku config:remove key [...]      # remove one or more config vars   
heroku config:clear                 # clear user-set vars and reset to default   

# stacks  
heroku stack                        # show current stack and list of available stacks   
heroku stack:migrate                # prepare migration of this app to a new stack      

# managing plugins  
heroku plugins                       # list installed plugins  
heroku plugins:install <url>         # install the plugin from the specified git url  
heroku plugins:uninstall <url/name>  # remove the specified plugin 
```
