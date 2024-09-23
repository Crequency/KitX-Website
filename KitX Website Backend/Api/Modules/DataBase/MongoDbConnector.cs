using MongoDB.Driver;
using MongoDB.Driver.Linq;

namespace KitX.Website.Backend.Api.Modules.DataBase;

public class MongoDbConnector(ILogger<IConnector> logger, string connectionString) : IConnector
{
    public ILogger<IConnector> Logger { get; init; } = logger;

    public string ConnectionString { get; init; } = connectionString;

    private MongoClient? mongoClient;

    public bool IsConnected => mongoClient is null;

    public IConnector Initialize()
    {
        mongoClient = new(ConnectionString);

        Logger.LogInformation(
            "@Init: {name}, Connected: {isConnected}, Connection String: {str}",
            nameof(MongoDbConnector),
            IsConnected,
            ConnectionString
        );

        return this;
    }

    public IMongoCollection<T>? GetCollection<T>(string dbName, string colName)
    {
        return mongoClient?.GetDatabase(dbName).GetCollection<T>(colName);
    }

    public IMongoQueryable<T> QueryCollection<T>(string dbName, string colName)
    {
        var collection = GetCollection<T>(dbName, colName);
        return collection.AsQueryable();
    }
}
