for i in (exa fennel)
    fennel -c fennel/$i > ../lua/small_plugins/(echo $i|sed 's/.fnl$/.lua/')
end
for i in (exa lua)
    cp lua/$i ../lua/small_plugins/$i
end
