using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using TaskProcessor;


IHost host = Host.CreateDefaultBuilder(args)
.ConfigureServices(services =>
{
    services.AddHostedService<ConsumerService>();
})
.Build();



await host.RunAsync();