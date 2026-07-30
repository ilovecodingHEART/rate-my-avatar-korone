-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    dependencies = {
        charm = "littensy/charm@^0.10"
    }, 
    package = {
        exclude = {
            "package.json", 
            "node_modules"
        }, 
        include = {
            "LICENSE.md"
        }, 
        name = "littensy/charm-sync", 
        realm = "shared", 
        registry = "https://github.com/UpliftGames/wally-index", 
        version = "0.3.0"
    }
};