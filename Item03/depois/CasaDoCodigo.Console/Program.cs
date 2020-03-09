using CasaDoCodigo.Areas.Carrinho.Models;
using Newtonsoft.Json;
using StackExchange.Redis;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace CasaDoCodigo.Console
{
    class Program
    {
        private const string clienteId = "id_do_cliente";

        static async Task Main(string[] args)
        {
            IConnectionMultiplexer _redis = await ConnectionMultiplexer.ConnectAsync("localhost");
            IDatabase _database = _redis.GetDatabase(db: 0);

            Carrinho carrinho = null;
            ItemCarrinho novoItemCarrinho = new ItemCarrinho(clienteId, "001", "ASP.NET Core com Múltiplas Bases de Dados", 50.0m, 1);
            var json = await _database.StringGetAsync(clienteId);
            if (json.IsNullOrEmpty)
            {
                carrinho = new Carrinho(clienteId);
                carrinho.Itens.Add(novoItemCarrinho);
                json = JsonConvert.SerializeObject(carrinho);
                await _database.StringSetAsync(clienteId, json);
            }

            json = await _database.StringGetAsync(clienteId);
            carrinho = JsonConvert.DeserializeObject<Carrinho>(json);

            ImprimirCarrinho(carrinho);

            var itemCarrinho = 
                carrinho.Itens.Where(i => i.ProdutoCodigo == "001").Single();

            itemCarrinho.Quantidade = 7;
            json = JsonConvert.SerializeObject(carrinho);
            await _database.StringSetAsync(clienteId, json);

            ImprimirCarrinho(carrinho);

            await _database.KeyDeleteAsync(clienteId);

            System.Console.WriteLine("Tecle ENTER para sair...");
            System.Console.ReadLine();
        }

        private static void ImprimirCarrinho(Carrinho carrinho)
        {
            System.Console.WriteLine();
            System.Console.WriteLine("Carrinho:");
            System.Console.WriteLine("=========");
            
            System.Console.WriteLine("Id do cliente: {0}", carrinho.ClienteId);
            System.Console.WriteLine("Total: {0:C}", carrinho.Total);

            System.Console.WriteLine("Produtos:");
            System.Console.WriteLine("=========");
            foreach (var item in carrinho.Itens)
            {
                System.Console.WriteLine("Codigo: {0}, Nome: {1}, Preço Unitário: {2:C}, Quantidade: {3}, Subtotal: {4:C}"
                    , item.ProdutoCodigo, item.ProdutoNome, item.PrecoUnitario, item.Quantidade, item.Subtotal);
            }
            System.Console.WriteLine();
        }
    }
}
