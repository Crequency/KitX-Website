namespace KitX.Website.Backend.Api.Modules.Interfaces;

public interface IModule
{
    public string Name { get; init; }

    public string Description { get; init; }

    public string Version { get; init; }

    public Type? GetManagerType();
}