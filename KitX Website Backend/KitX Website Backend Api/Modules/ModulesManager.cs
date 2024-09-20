using KitX_Website_Backend.Api.Modules.DataBase;
using KitX_Website_Backend.Api.Modules.Interfaces;
using KitX_Website_Backend.Api.Modules.Kxp;

namespace KitX_Website_Backend.Api.Modules;

public class ModulesManager
{
    public ILogger<ModulesManager> Logger { get; init; }

    public List<IModule> ModulesPool { get; init; }

    public ModulesManager(ILogger<ModulesManager> logger)
    {
        Logger = logger;

        ModulesPool = [
            new DataBaseModule(),
            new AccountsModule(),
            new KxpModule(),
        ];
    }
}
