using KitX.Website.Backend.Api.Modules.Interfaces;

namespace KitX.Website.Backend.Api.Modules.DataBase;

public class DataBaseModule : IModule
{
    public string Name { get; init; }

    public string Description { get; init; }

    public string Version { get; init; }

    public DataBaseModule()
    {
        Name = "DataBase";

        Description = "Connects to DataBase and provides methods to operate it";

        Version = "v0.0.1";
    }

    public Type? GetManagerType() => null;
}