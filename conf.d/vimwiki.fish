function vimwiki 
    if test (count $argv) -eq 0
        vim +"VimwikiIndex"
    else if test $argv[1] = "git"
        git -C ~/vimwiki/ $argv[2..-1]
    else
        echo "Usage: vimwiki [git] [args ...]"
    end
end
