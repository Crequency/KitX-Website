using KitX_Website_Backend.Api.Modules.DataBase;
using KitX_Website_Backend.Api.Modules.Interfaces;

namespace KitX_Website_Backend.Api.Modules.Accounts;

public class AccountsManager : IManager
{
    public ILogger<IManager> Logger { get; init; }

    public WebApplication? App { get; init; }

    public AccountsManager(ILogger<AccountsManager> logger, WebApplication app)
    {
        Logger = logger;

        App = app;
    }

    public AccountsManager Initialize()
    {
        using var scope = App!.Services.CreateScope();

        var provider = scope.ServiceProvider;

        var dbConnector = provider.GetRequiredService<IConnector>();

        

        return this;
    }
}