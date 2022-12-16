for i in (exa self_plugins)
    fennel -c self_plugins/$i > ../lua/self_plugins/(echo $i|sed 's/.fnl$/.lua/')
end
