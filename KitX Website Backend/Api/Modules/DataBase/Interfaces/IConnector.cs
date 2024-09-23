namespace KitX.Website.Backend.Api.Modules.DataBase;

public interface IConnector
{
    public ILogger<IConnector> Logger { get; init; }

    public string ConnectionString { get; init; }

    public bool IsConnected { get; }

    public IConnector Initialize();
}
