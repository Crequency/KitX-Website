using KitX_Website_Backend.Api.Modules.Accounts;
using KitX_Website_Backend.Api.Modules.Interfaces;

namespace KitX_Website_Backend.Api.Modules.DataBase;

public class AccountsModule : IModule
{
    public string Name { get; init; }

    public string Description { get; init; }

    public string Version { get; init; }

    public AccountsModule()
    {
        Name = "Accounts";

        Description = "Manage accounts automatically";

        Version = "v0.0.1";
    }

    public Type? GetManagerType() => typeof(AccountsManager);
}