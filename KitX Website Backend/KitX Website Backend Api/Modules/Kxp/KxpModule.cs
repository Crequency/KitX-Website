using KitX_Website_Backend.Api.Modules.Interfaces;

namespace KitX_Website_Backend.Api.Modules.Kxp;

public class KxpModule : IModule
{
    public string Name { get; init; }

    public string Description { get; init; }

    public string Version { get; init; }

    public KxpModule()
    {
        Name = "Kxp";

        Description = "To manage KitX Extension Packages";

        Version = "v0.0.1";
    }

    public Type? GetManagerType() => null;
}