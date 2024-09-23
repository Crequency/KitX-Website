using KitX.Shared.CSharp.Plugin;
using Microsoft.AspNetCore.Mvc;

namespace KitX.Website.Backend.Api.Controllers;

[ApiController]
[Route("[controller]")]
public class KxpController : ControllerBase
{
    private readonly ILogger<KxpController> _logger;

    public KxpController(ILogger<KxpController> logger)
    {
        _logger = logger;
    }

    [HttpGet(Name = "QueryKxp")]
    public IEnumerable<PluginInfo> Get()
    {
        return Enumerable.Range(1, 5).Select(index => new PluginInfo())
        .ToArray();
    }
}
